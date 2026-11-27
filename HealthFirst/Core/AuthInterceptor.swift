//
//  AuthInterceptor.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation
import Alamofire

final class JWTInterceptor: RequestInterceptor {
    
    private let tokenRefresher = TokenRefresher()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        let requiresAuth = request.value(forHTTPHeaderField: "Requires-Auth") == "true"
        let isRetryWithAuth = request.value(forHTTPHeaderField: "Authorization") != nil
        
        if requiresAuth || isRetryWithAuth {
            request.setValue(nil, forHTTPHeaderField: "Requires-Auth")
            if let token = KeychainManager.shared.getAccessToken() {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        }
        
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
              response.statusCode == 403 else {
            completion(.doNotRetry)
            return
        }
        
        guard request.retryCount == 0 else {
            completion(.doNotRetry)
            return
        }
        
        Task {
            let isRefreshed = await tokenRefresher.refreshIfNeeded()
            
            if isRefreshed {
                completion(.retry)
            } else {
                await MainActor.run {
                    NotificationCenter.default.post(name: NSNotification.Name("UserSessionExpired"), object: nil)
                }
                completion(.doNotRetry)
            }
        }
    }
}

private actor TokenRefresher {
    
    private var refreshTask: Task<Bool, Never>?
    
    private let refreshSession: Session = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return Session(configuration: config)
    }()
    
    func refreshIfNeeded() async -> Bool {
        if let existingTask = refreshTask {
            return await existingTask.value
        }
        
        let task = Task<Bool, Never> {
            defer { refreshTask = nil }
            
            guard let refreshToken = KeychainManager.shared.getRefreshToken() else {
                return false
            }
            
            let url = "https://health-first-backend-b00h.onrender.com/api/auth/refresh"
            let parameters: Parameters = ["token": refreshToken]
            
            let response = await refreshSession.request(
                url,
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default
            )
            .validate(statusCode: 200..<300)
            .serializingDecodable(APIResponse<RefreshTokenResponse>.self)
            .response
            
            if let data = response.value?.data {
                await KeychainManager.shared.deleteAll()
                await KeychainManager.shared.saveAccessToken(token: data.accessToken)
                await KeychainManager.shared.saveRefreshToken(token: data.refreshToken)
                return true
            } else {
                print("Token refresh failed: \(response.error?.localizedDescription ?? "Unknown error")")
                return false
            }
        }
        
        refreshTask = task
        return await task.value
    }
}


nonisolated struct RefreshTokenResponse: Codable, Sendable {
    let accessToken: String
    let refreshToken: String
}

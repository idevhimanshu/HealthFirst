//
//  AuthInterceptor.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation
import Alamofire

final class JWTInterceptor: RequestInterceptor {
    
   
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        if request.value(forHTTPHeaderField: "Requires-Auth") == "true" {
            request.setValue(nil, forHTTPHeaderField: "Requires-Auth") // Remove internal flag
            
            if let token = KeychainManager.shared.getAccessToken() {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        }
        
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            KeychainManager.shared.deleteAll()
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name("UserSessionExpired"), object: nil)
            }
        }

        completion(.doNotRetry)
    }
}

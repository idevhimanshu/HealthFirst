//
//  APIClient.swift
//  HealthFirst
//
//  Created by Himanshu on 16/10/26.
//

import Foundation
import Alamofire

//import Alamofire

enum NetworkError: Error {
    case invalidUrl
    case noInternet
    case unauthorized
    case serverError(statusCode: Int, messsage: String)
    case decodingError
    case requestFaild(String)
    case unknown
}


final class NetworkManger {
    
    static let shared = NetworkManger()
    private let baseUrl = "https://health-first-backend-b00h.onrender.com/"
    private let session: Session
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let interceptor = JWTInterceptor()
        self.session = Session(configuration: configuration, interceptor: interceptor)
    }
    
    func sendRequest<T: Decodable>(endpoint: String, parameter: Parameters? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, requiresAuth: Bool = true) async -> Result<T,NetworkError>{
        
        let url = baseUrl + endpoint
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
        var finalHeaders = headers ?? HTTPHeaders()
        if requiresAuth {
                    finalHeaders.add(name: "Requires-Auth", value: "true")
                }
        
        do {
            
            let request =  session.request(url, method: method, parameters: parameter, encoding:  encoding, headers:  finalHeaders )
            print(request)
            
            let response = await request
                .validate(statusCode: 200..<300)
                .serializingDecodable(APIResponse<T>.self)
                .response
            
            if let error = response.error {
                if let statusCode = response.response?.statusCode {
                    if !(200..<300).contains(statusCode){
                        let message: String
                        if let data = response.data, let errorResponse = try? JSONDecoder().decode(APIResponse<T>.self, from: data) {
                            message = errorResponse.message
                        } else {
                            message = "Something wen wrong"
                        }
                        return .failure(.serverError(statusCode: statusCode, messsage: message))
                    }
                }
                
                if let afError = error.asAFError, case .responseSerializationFailed = afError {
                    return .failure(.decodingError)
                }
                
                if let urlError = error.underlyingError as? URLError, urlError.code == .notConnectedToInternet {
                    return .failure(.noInternet)
                }
                
                return .failure(.requestFaild(error.localizedDescription))
            }
            
            guard let data = response.value else {
                return .failure(.unknown)
            }
            
            if T.self == Logout.self {
                return .success(Logout() as! T)
            }
            
            guard let data = data.data else {
                return .failure(.unknown)
            }
            
            return .success(data)
        }
    }
}

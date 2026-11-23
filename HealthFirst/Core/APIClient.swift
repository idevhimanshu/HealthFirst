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
    
    var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "Given url is invalid"
        case .noInternet:
            return "Check your internet connection"
        case .unauthorized:
            return "You are unathorize for it"
        case .serverError(let statusCode, let messsage):
            return messsage
        case .decodingError:
            return "unable to decode json"
        case .requestFaild(let message):
            return message
        case .unknown:
            return "Something went wrong"
        }
    }
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
            
            let request =  session.request(url, method: method, parameters: parameter, encoding:  encoding, headers:  finalHeaders)
            
            let response = await request
                .validate(statusCode: 200..<300)
                .serializingDecodable(APIResponse<T>.self)
                .response
            
            if let finalRequest = response.request {
                print("Request \(finalRequest.httpMethod ?? "") \(finalRequest.url?.absoluteString ?? "") ")
                print("Parameter \(finalRequest.allHTTPHeaderFields ?? [:])")
                
                if let bodyData = finalRequest.httpBody, let bodyString = String(data: bodyData, encoding: .utf8){
                    print("Parameter \(bodyString)")
                }
            }
            
            if let responseData = response.data {
                print("Status code: \(response.response?.statusCode ?? 0)")
                        if let jsonObject = try? JSONSerialization.jsonObject(with: responseData, options: []),
                           let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
                           let prettyString = String(data: prettyData, encoding: .utf8) {
                            print("Response:\(prettyString)")
                        } else if let rawString = String(data: responseData, encoding: .utf8) {
                            print("📄 [RESPONSE RAW]:\n\(rawString)")
                        }
                    } else {
                        print("Response : Empty / No Data")
                    }
            
            if let error = response.error {
                if let statusCode = response.response?.statusCode {
                    if !(200..<300).contains(statusCode){
                        let message: String
                        if let data = response.data, let errorResponse = try? JSONDecoder().decode(APIResponse<T>.self, from: data) {
                            message = errorResponse.message
                        } else {
                            message = "data is empty or unable to decode json"
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

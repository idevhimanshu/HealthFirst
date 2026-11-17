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
        self.session = Session(configuration: configuration)
    }
    
    func sendRequest<T: Decodable>(endpoint: String, parameter: Parameters? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil) async -> Result<T,NetworkError>{
        
        let url = baseUrl + endpoint
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
        
        do {
            let response = await session.request(url, method: method, parameters: parameter, encoding:  encoding, headers:  headers)
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
            
            guard let data = response.value?.data else {
                return .failure(.unknown)
            }
            
            return .success(data)
        }
        
    }
    
    
//    func sendRequest<T: Decodable>(url: String, parameter: [String: Any], method: HTTPMethod) async -> APIResponse<T> {
//        let encoder: ParameterEncoding = (method == .get) ? URLEncoding.default : JSONEncoding.default
//        let dataTask = AF.request(url, method: method, parameters: parameter,encoding: encoder, interceptor: .retryPolicy)
//        print(dataTask)
//        let response = await dataTask.serializingDecodable(APIResponse<T>.self).response
//        print(response)
//        
//        if let error = response.error {
//            print(error.localizedDescription)
//        }
//        
//        if let statusCode = response.response?.statusCode, statusCode > 300 {
//            print("Server error with satatus code: \(statusCode)")
//        }
//        
//        guard let data = response.value else {
//            print("unable to decode data")
//            return APIResponse(status: false, message: "Something went wrong", data: nil)
//            
//        }
//        
//        return data
//       
//    }
//    
    

}

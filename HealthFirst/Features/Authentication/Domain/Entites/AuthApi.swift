//
//  AuthApi.swift
//  HealthFirst
//
//  Created by Himanshu on 17/11/26.
//

import Foundation
import Alamofire

enum AuthApi: APIEndpoints {
    
    case login(email: String, password: String)
    
    var path: String {
        switch self {
        case .login:
            return "api/auth/patient/login"
        }
        
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameter: Alamofire.Parameters? {
        switch self {
        case .login(let email, let password):
            return [
                "email":email,
                "password": password
            ]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .login:
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
    
    
}

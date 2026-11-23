//
//  SettingEndpoints.swift
//  HealthFirst
//
//  Created by Himanshu on 22/11/26.
//

import Foundation
import Alamofire

enum SettingEndpoints: APIEndpoints {
    
    case logout(refreshToken: String)
    
    var path: String {
        switch self {
        case .logout(let refreshToken):
            return "api/auth/patient/logout"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .logout(let refreshToken):
            return .post
        }
        
    }
    
    var parameter: Parameters? {
        switch self {
        case .logout(let refreshToken):
            return ["token": refreshToken]
        }
        
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .logout(let refreshToken):
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
    
    
    
}

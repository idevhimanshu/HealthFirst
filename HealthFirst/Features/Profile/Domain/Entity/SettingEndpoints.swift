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
    case changeProfileImage(data: Data, file: MultipartFile)
    
    var path: String {
        switch self {
        case .logout(_):
            return "api/auth/patient/logout"
        case .changeProfileImage(_, _):
            return "api/profile-image"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .logout(_):
            return .post
        case .changeProfileImage(_, _):
            return .post
        }
        
    }
    
    var parameter: Parameters? {
        switch self {
        case .logout(let refreshToken):
            return ["token": refreshToken]
        case .changeProfileImage(_, _):
             return nil
        }
        
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .logout(_):
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        case .changeProfileImage(_, _):
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
    
    var file: MultipartFile? {
        switch self {
        case .logout(let refreshToken):
            return nil
        case .changeProfileImage(_, let file):
            return file
        }
    }
    
    
    
}

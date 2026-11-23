//
//  HomeEndpoints.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation
import Alamofire

enum HomeEndpoints: APIEndpoints {
    
    case getDoctorList
    
    var path: String {
        switch self {
        case .getDoctorList:
            return "api/doctor/doctors"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getDoctorList:
            return .get
        }
    }
    
    var parameter: Alamofire.Parameters? {
        switch self {
        case .getDoctorList:
            return nil
        }
    }
    
    var header: Alamofire.HTTPHeaders? {
        switch self {
        case .getDoctorList:
            return nil
        }
    }
    
    
    
}

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
    case getUserDetails
    case searchDoctors(specializaiton: String)
    
    var path: String {
        switch self {
        case .getDoctorList:
            return "api/doctor/doctors"
        case .getUserDetails:
            return "api/profile"
        case .searchDoctors(_):
            return "api/doctor/search"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getDoctorList:
            return .get
        case .getUserDetails:
            return .get
        case .searchDoctors(_):
            return .get
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getDoctorList:
            return nil
        case .getUserDetails:
            return nil
        case .searchDoctors(let specializaiton):
            return [
               "specializaiton": specializaiton
           ]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getDoctorList:
            return nil
        case .getUserDetails:
            return nil
        case .searchDoctors(_):
            return nil
             
        }
    }
    
    var file: MultipartFile? {
        switch self {
        case .getDoctorList:
            return nil
        case .getUserDetails:
            return nil
        case .searchDoctors(let specializaiton):
            return nil
        }
    }
    
}

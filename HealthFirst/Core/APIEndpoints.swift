//
//  APIEndpoints.swift
//  HealthFirst
//
//  Created by Himanshu on 17/11/26.
//

import Foundation
import Alamofire

protocol APIEndpoints {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: Parameters? { get }
    var header: HTTPHeaders? { get }
}

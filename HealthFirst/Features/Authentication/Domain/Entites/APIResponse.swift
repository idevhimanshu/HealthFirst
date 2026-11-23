//
//  APIResponse.swift
//  HealthFirst
//
//  Created by Himanshu on 15/11/26.
//

import Foundation
//nonisolated struct APIResponse<T: Decodable > : Decodable {
//    let status: Bool
//    let message: String
//    let data : T
//}

nonisolated struct APIResponse<T: Decodable & Sendable>: Decodable, Sendable {
    let status: Bool
    let message: String
    let data: T?
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
}

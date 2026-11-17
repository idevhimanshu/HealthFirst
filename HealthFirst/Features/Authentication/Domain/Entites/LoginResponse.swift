//
//  LoginResponse.swift
//  HealthFirst
//
//  Created by Himanshu on 15/11/26.
//

import Foundation

nonisolated struct LoginResponse: Codable, Sendable {
    
    let id: Int
    let name: String
    let email: String
    let password: String?
    let mobileNumber: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case password
        case mobileNumber
        case token
    }
}

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
        let mobileNumber: String
        let accessToken: String
        let refreshToken: String
        let tokenType: String
        let role: String

        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case email = "email"
            case mobileNumber = "mobileNumber"
            case accessToken = "accessToken"
            case refreshToken = "refreshToken"
            case tokenType = "tokenType"
            case role = "role"
        }
}

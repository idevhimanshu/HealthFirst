//
//  LoginRepositoryProtocol.swift
//  HealthFirst
//
//  Created by Himanshu on 15/11/26.
//

import Foundation
protocol LoginRepositoryProtocol {
    func login(endpoint: APIEndpoints) async throws -> LoginResponse
}

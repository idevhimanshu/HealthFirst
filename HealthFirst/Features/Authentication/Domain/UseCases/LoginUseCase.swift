//
//  LoginUseCase.swift
//  HealthFirst
//
//  Created by Himanshu on 15/11/26.
//

import Foundation
protocol LoginUseCaseProtocol {
    func login(endpoints: APIEndpoints) async throws -> LoginResponse
}

class LoginUseCase : LoginUseCaseProtocol {
    let loginRepository: LoginRepositoryProtocol
    
    init(loginRepository: LoginRepositoryProtocol) {
        self.loginRepository = loginRepository
    }
    
    func login(endpoints: APIEndpoints) async throws -> LoginResponse {
        return try await loginRepository.login(endpoint: endpoints )
    }
    
    
}

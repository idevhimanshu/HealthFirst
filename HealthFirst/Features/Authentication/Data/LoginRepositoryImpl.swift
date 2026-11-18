//
//  LoginRepositoryImpl.swift
//  HealthFirst
//
//  Created by Himanshu on 16/11/26.
//

import Foundation
import Alamofire

class LoginRepositoryImpl : LoginRepositoryProtocol {
    
    private let networkManager: NetworkManger
    private let keychainManager: KeychainManager
    
    init(networkManager: NetworkManger, keychainManager: KeychainManager) {
        self.networkManager = networkManager
        self.keychainManager = keychainManager
    }
    
    func login(endpoint: APIEndpoints) async throws -> LoginResponse {
        
        let result: Result<LoginResponse, NetworkError> =  await networkManager.sendRequest(endpoint: endpoint.path, parameter: endpoint.parameter, method: endpoint.method, headers: endpoint.header )
        
        switch result {
        case .success(let apiResponse):
            keychainManager.savetoken(token: apiResponse.token)
            return apiResponse
        case .failure(let failure):
            throw failure
        }
        
    }
    
    
}

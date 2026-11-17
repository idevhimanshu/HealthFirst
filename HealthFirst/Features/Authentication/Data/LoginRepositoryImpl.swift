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
    
    init(networkManager: NetworkManger) {
        self.networkManager = networkManager
    }
    
    func login(endpoint: APIEndpoints) async throws -> LoginResponse {
        
        let result: Result<LoginResponse, NetworkError> =  await networkManager.sendRequest(endpoint: endpoint.path, parameter: endpoint.parameter, method: endpoint.method, headers: endpoint.header )
        
        switch result {
        case .success(let apiResponse):
            return apiResponse
        case .failure(let failure):
            throw failure
        }
        
    }
    
    
}

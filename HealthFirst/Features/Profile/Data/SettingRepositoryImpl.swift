//
//  SettingRepositoryImpl.swift
//  HealthFirst
//
//  Created by Himanshu on 22/11/26.
//

import Foundation

final class SettingRepositoryImpl: SettingRepository {
    
    
    let keychainManager: KeychainManager
    let networkManager: NetworkManger
    
    init(keychainManager: KeychainManager, networkManager: NetworkManger) {
        self.keychainManager = keychainManager
        self.networkManager = networkManager
    }
    
    func logout(endpoint: APIEndpoints) async throws -> Bool {
        let result: Result<Logout, NetworkError> = await networkManager.sendRequest(endpoint: endpoint.path, parameter: endpoint.parameter, method: endpoint.method, headers: endpoint.header)
        switch result {
        case .success(_):
            keychainManager.deleteAll()
            return true
        case .failure(let error):
            throw error
            
            
        }
    }
    
    func changedProfileImage(endpoint: APIEndpoints) async throws -> Bool {
        let result: Result<String, NetworkError> =  await networkManager.uploadMultipart(endpoint: endpoint.path, files: [endpoint.file].compactMap { $0 }, method: endpoint.method, headers:  endpoint.header)
        
        switch result {
        case .success(let success):
            print(success)
            return true
        case .failure(let error):
            throw error
        }
    }
    
    
    
    
}

//
//  SettingUseCases.swift
//  HealthFirst
//
//  Created by Himanshu on 22/11/26.
//

import Foundation

protocol SettingUseCasesProtocol {
    func logout() async throws -> Bool
    func changeImage(data: Data, file: MultipartFile) async throws -> Bool
}

final class SettingUseCases: SettingUseCasesProtocol {
    
    let settingRepository: SettingRepository
    let keychainManager: KeychainManager
    
    init(settingRepository: SettingRepository, keychainManager: KeychainManager) {
        self.settingRepository = settingRepository
        self.keychainManager = keychainManager
    }
    
    func logout() async throws -> Bool {
        return try await settingRepository.logout(endpoint: SettingEndpoints.logout(refreshToken: keychainManager.getRefreshToken() ?? ""))
    }
    
    func changeImage(data: Data, file: MultipartFile) async throws -> Bool {
        return try await settingRepository.changedProfileImage(endpoint: SettingEndpoints.changeProfileImage(data: data, file: file))
        
    }
    
    
}

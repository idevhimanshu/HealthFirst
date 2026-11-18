//
//  DetermineInitialScreenUseCase.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import Foundation
protocol DetermineInitialScreenUseCaseProtocol {
    func execute() async -> AppLaunchState
}

final class DetermineInitialScreenUseCase: DetermineInitialScreenUseCaseProtocol {
    private let keychainManger: KeychainManager
    
    init(keychainManger: KeychainManager) {
        self.keychainManger = keychainManger
    }
    
    func execute() async -> AppLaunchState {
        if keychainManger.hasToken() {
            return AppLaunchState.home
        } else {
            return AppLaunchState.login
        }
    }
    
    
}

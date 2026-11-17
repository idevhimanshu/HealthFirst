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
    func execute() async -> AppLaunchState {
        return AppLaunchState.login
    }
    
    
}

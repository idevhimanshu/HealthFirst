//
//  SplashViewModel.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import Foundation

@Observable
final class SplashViewModel {
    
    public var launchState: AppLaunchState = .login
    private let determineInitialScreenUseCase: DetermineInitialScreenUseCaseProtocol
     var isNavigateToLoginScreen: Bool = false
    var isNavigateToHomeScreen: Bool = false
    
    init(determineInitialScreenUseCase: DetermineInitialScreenUseCaseProtocol) {
        self.determineInitialScreenUseCase = determineInitialScreenUseCase
    }
    
    func start() async {
        launchState = await determineInitialScreenUseCase.execute()
        switch launchState {
        case .login:
            isNavigateToLoginScreen = true
        case .home:
            isNavigateToHomeScreen = true
        }
        
    }
}

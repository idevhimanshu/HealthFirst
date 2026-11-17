//
//  SplashViewModel.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import Foundation

@Observable
final class SplashViewModel {
    
    public var launchState: AppLaunchState?
    private let determineInitialScreenUseCase: DetermineInitialScreenUseCaseProtocol
    private var isNavigateToNextScreen: Bool = false
    
    init(determineInitialScreenUseCase: DetermineInitialScreenUseCaseProtocol) {
        self.determineInitialScreenUseCase = determineInitialScreenUseCase
    }
    
    func start() async {
        launchState = await determineInitialScreenUseCase.execute()
        
    }
}

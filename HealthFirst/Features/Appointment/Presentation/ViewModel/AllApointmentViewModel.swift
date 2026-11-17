//
//  AllApointmentViewModel.swift
//  HealthFirst
//
//  Created by Himanshu on 10/10/26.
//

import Foundation
import Combine

@Observable
final class AllApointmentViewModel {
    
    var isNavigateToReviewScreen: Bool = false
    var isNavigateToCancelScreen: Bool = false
    
    func navigateToReviewScreen() {
        isNavigateToReviewScreen.toggle()
    }
    
    func navigateToCancelScreen() {
        isNavigateToCancelScreen.toggle()
    }
}

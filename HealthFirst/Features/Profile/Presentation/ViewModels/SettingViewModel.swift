//
//  SettingViewModel.swift
//  HealthFirst
//
//  Created by Himanshu on 22/11/26.
//

import Foundation

@Observable
final class SettingViewModel {
    
    let settingUseCases: SettingUseCases
    var alertTitle: String = ""
    var alertMessage: String = ""
    var isShowAlert: Bool = false
    var isLoading: Bool = false
    var isNavigateToLoginScreen: Bool = false
    
    init(settingUseCases: SettingUseCases) {
        self.settingUseCases = settingUseCases
    }
    
    func logout() async -> Bool {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            return try  await settingUseCases.logout()
//            if isLogout {
//                isNavigateToLoginScreen = true
//            }
        } catch let error as NetworkError {
            switch error {
            case .invalidUrl:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .noInternet:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .unauthorized:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .serverError(let statusCode, let messsage):
                alertMessage = messsage
                isShowAlert.toggle()
            case .decodingError:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .requestFaild(let string):
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .unknown:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            }
        } catch {
            alertMessage = error.localizedDescription
            isShowAlert.toggle()
            print(error.localizedDescription)
        }
        return false
    }
    
}

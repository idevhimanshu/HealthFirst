//
//  LoginViewModel.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import Foundation
@Observable
final class LoginViewModel {
    
    var alertMessage: String = ""
    var alertTitle: String = ""
    var isShowAlert: Bool = false
    var isLoading: Bool = false
    var isNavigateToHomeView: Bool = false
//
//    let authValidator: AuthValidator = AuthValidator()
    let loginUseCaseProtocol: LoginUseCaseProtocol
    
    init(loginUseCaseProtocol: LoginUseCaseProtocol) {
        self.loginUseCaseProtocol = loginUseCaseProtocol
    }
    
    func login(email: String, password: String) async -> Bool {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let user = try await loginUseCaseProtocol.login(endpoints: AuthApi.login(email: email, password: password))
            return true
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
    
//    func loginValidation(_ email: String, _ password: String) -> Bool {
//        
//        guard !email.isEmpty else {
//            alertTitle = "Email"
//            alertMessage = "Email field can not be empty."
//            isShowAlert.toggle()
//            return false
//        }
//        
//        guard authValidator.isValidEmail(email: email) else {
//            alertTitle = "Email"
//            alertMessage = "Please enter valid email address."
//            isShowAlert.toggle()
//            return false
//        }
//        
//        guard !password.isEmpty else {
//            alertTitle = "Password"
//            alertMessage = "Password field can not be empty."
//            isShowAlert.toggle()
//            return false
//        }
//        
//        guard authValidator.isValidPassword(password) else{
//            alertTitle = "Password"
//            alertMessage = "Must be 8+ characters with mixed-case letters, a number, and a special character."
//            isShowAlert.toggle()
//            return false
//        }
//        
//        return true
//    }
}

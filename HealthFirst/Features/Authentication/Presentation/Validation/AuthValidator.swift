//
//  AuthValidator.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import Foundation

final class AuthValidator {
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>/?\\\\|]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: password)
    }

    func isValidMobileNumber(_ mobileNumber: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: mobileNumber)
    }
}

//
//  SignUpViewModel.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import Foundation
struct SignupRequest: Codable{
    let name: String
    let mobileNumber: String
    let email: String
    let password: String
}

struct SignupResponse: Decodable, Sendable {
    let name: String
    let mobileNumber: String
    let email: String
    let password: String
}


@Observable
final class SignUpViewModel {
    
    var alertMessage: String = ""
    var alertTitle: String = ""
    var isShowAlert: Bool = false
    
    func validateSignup(name: String, email: String, mobileNumber: String, password: String) -> Bool {
        
        guard !name.isEmpty else {
            alertTitle = "Name"
            alertMessage = "Name field can not be empty."
            isShowAlert.toggle()
            return false
        }
        
        guard !email.isEmpty else {
            alertTitle = "Email"
            alertMessage = "Email field can not be empty."
            isShowAlert.toggle()
            return false
        }
        
        guard isValidEmail(email: email) else {
            alertTitle = "Email"
            alertMessage = "Please enter valid email address."
            isShowAlert.toggle()
            return false
        }
        
        guard !mobileNumber.isEmpty else {
            alertTitle = "Mobile number"
            alertMessage = "Mobile number field can not be empty."
            isShowAlert.toggle()
            return false
        }
        
        guard isValidMobileNumber(mobileNumber) else {
            alertTitle = "Mobile number"
            alertMessage = "Please enter valid mobile number."
            isShowAlert.toggle()
            return false
        }
        
        guard !password.isEmpty else {
            alertTitle = "Password"
            alertMessage = "Password field can not be empty."
            isShowAlert.toggle()
            return false
        }
        
        guard isValidPassword(password) else{
            alertTitle = "Password"
            alertMessage = "Must be 8+ characters with mixed-case letters, a number, and a special character."
            isShowAlert.toggle()
            return false
        }
        
        return true
    }
    
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
  
    
    func signup(name: String, mobileNumber: String, email: String, password: String){
        guard let url = URL(string: "") else {
            print("Invalid url")
            return
        }
        var signupRequest = SignupRequest   (name: name, mobileNumber: mobileNumber, email: email, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(signupRequest)
        } catch {
            print("Unable to encode the data")
        }
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error  {
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                print("data is empty")
                return
            }
                do {
                    let response =  try JSONDecoder().decode(SignupResponse.self, from: data)
                    print(response)
                } catch {
                    print("unable to decode the data to json")
                }
            
        }.resume()
    }
}

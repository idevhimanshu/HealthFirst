//
//  SignUpView.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var mobileNumber: String = ""
    @State private var signupViewModel: SignUpViewModel = SignUpViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Create new account")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundColor(Color("_2260FF"))
                
                Text("Create an account or log in to explore about our app")
                    .font(.custom("LeagueSpartan-Light", size: 18))
                   
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Full name")
                            .font(.custom("LeagueSpartan-Medium", size: 16))
                        
                        TextField("Enter your name", text: $fullName)
                            .font(.custom("LeagueSpartan-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .frame(height: 45)
                            .background(Color("_ECF1FF"))
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Email")
                            .font(.custom("LeagueSpartan-Medium", size: 16))
                        
                        TextField("Enter your email", text: $email)
                            .font(.custom("LeagueSpartan-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .frame(height: 45)
                            .background(Color("_ECF1FF"))
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Mobile Number")
                            .font(.custom("LeagueSpartan-Medium", size: 16))
                        
                        TextField("Enter your mobile number", text: $mobileNumber)
                            .font(.custom("LeagueSpartan-Regular", size: 16))
                            .foregroundColor(.black)
                            .frame(height: 45)
                            .padding(.horizontal, 16)
                            .background(Color("_ECF1FF"))
                            .cornerRadius(8)
                            
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Password")
                            .font(.custom("LeagueSpartan-Medium", size: 16))
                        
                            TextField("Emter your password", text: $password)
                            .font(.custom("LeagueSpartan-Regular", size: 16))
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                                .frame(height: 45)
                                .background(Color("_ECF1FF"))
                                .cornerRadius(8)
        
                    }
                    
                    Button {
                        let auth = signupViewModel.validateSignup(name: fullName, email: email, mobileNumber: mobileNumber, password: password)
                        print(auth)
                    } label: {
                        VStack {
                            Text("Sign Up")
                                .font(.custom("LeagueSpartan-Medium", size: 20))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color("_2260FF"))
                        .cornerRadius(8)
                    }
                }
                .padding(.vertical, 20)
                
                VStack(alignment: .center) {
                    
                    Text("or sign up with")
                        .font(.custom("LeagueSpartan-Light", size: 18))
                    
                    HStack {
                        Circle()
                            .foregroundColor(Color("_CAD6FF"))
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image("GoogleIcon")
                            }
                        
                        Circle()
                            .foregroundColor(Color("_CAD6FF"))
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image("FacebookIcon")
                            }
                        
                        Circle()
                            .foregroundColor(Color("_CAD6FF"))
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image("TuchlockIcon")
                            }
                    }
                    .padding(.vertical, 20)
                    
                    HStack {
                        
                        Text("Already have an account?")
                            .font(.custom("LeagueSpartan-Light", size: 18))
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Log In")
                                .font(.custom("LeagueSpartan-Light", size: 18))
                                .foregroundColor(Color("_2260FF"))
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
            }
            
        }
        .padding(.horizontal, 16)
        .background(Color("_FFFFFF"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden()
        .alert(isPresented: $signupViewModel.isShowAlert) {
            Alert(title: Text(signupViewModel.alertTitle), message: Text(signupViewModel.alertMessage), dismissButton: .cancel(Text("Ok")))
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Sign Up")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }

    }
}

#Preview {
    SignUpView()
}

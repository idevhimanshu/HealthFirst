//
//  LoginView.swift
//  HealthFirst
//
//  Created by LAPTOP BAZAAR on 28/09/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isNavigateToSignupView: Bool = false
    @State private var isNavigateToForgotPasswordView: Bool = false
    @State private var loginViewModel: LoginViewModel = LoginViewModel(loginUseCaseProtocol: LoginUseCase(loginRepository: LoginRepositoryImpl(networkManager: NetworkManger.shared)))
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Welcome")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundColor(Color("_2260FF"))
                
                Text("We missed you. Let’s get you signed in.")
                    .font(.custom("LeagueSpartan-Light", size: 18))
                   
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8){
                        Text("Email or Mobile Number")
                            .font(.custom("LeagueSpartan-Medium", size: 16))
                        
                        TextField("Enter your email or mobile number", text: $email)
                            .font(.custom("LeagueSpartan-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .frame(height: 45)
                            .background(Color("_ECF1FF"))
                            .cornerRadius(8)
                    }
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Password")
                            .font(.custom("LeagueSpartan-Medium", size: 16))
                        
                        VStack(alignment: .trailing, spacing: 8) {
                            TextField("Emter your password", text: $password)
                                .font(.custom("LeagueSpartan-Regular", size: 16))
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                                .frame(height: 45)
                                .background(Color("_ECF1FF"))
                                .cornerRadius(8)
                            
                            Button {
                                isNavigateToForgotPasswordView.toggle()
                            } label: {
                                Text("Forget Password?")
                            }
                        }
                    }
                    
                    Button {
                        Task {
                            await loginViewModel.login(email: email, password: password)
                          
                        }
                    } label: {
                        VStack {
                            Text("Log In")
                                .font(.custom("LeagueSpartan-Medium", size: 20))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color("_2260FF"))
                        .cornerRadius(8)
                        .overlay {
                            if loginViewModel.isLoading {
                                ProgressView()
                                    .tint(.white)
                            }
                        }
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
                        Text("Don't have an account? Sign Up")
                            .font(.custom("LeagueSpartan-Light", size: 18))
                        Button {
                            isNavigateToSignupView.toggle()
                        } label: {
                            Text("Sign Up")
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
        .navigationDestination(isPresented: $isNavigateToSignupView, destination: {
            SignUpView()
        })
        .navigationDestination(isPresented: $isNavigateToForgotPasswordView) {
            ForgotPasswordView()
        }
        .navigationDestination(isPresented: $loginViewModel.isNavigateToHomeView, destination: {
            CustomTabBarView()
        })
        .alert(isPresented: $loginViewModel.isShowAlert) {
            Alert(title: Text(loginViewModel.alertTitle), message: Text(loginViewModel.alertMessage), dismissButton: .cancel(Text("Ok")))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Log In")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }

    }
}

#Preview {
    LoginView()
}

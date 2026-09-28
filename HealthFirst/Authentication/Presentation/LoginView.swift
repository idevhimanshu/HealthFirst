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
    var body: some View {
        VStack(spacing: 16) {
            Text("Log In")
                .font(.custom("LeagueSpartan-SemiBold", size: 24))
                .foregroundStyle(Color("_2260FF"))
            
            Text("Welcome")
                .font(.custom("LeagueSpartan-SemiBold", size: 24))
                .foregroundColor(Color("_2260FF"))
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                .font(.custom("LeagueSpartan-Light", size: 12))
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8){
                    Text("Email or Mobile Number")
                        .font(.custom("LeagueSpartan-Medium", size: 20))
                    
                    TextField("Enter your email or mobile number", text: $email)
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .frame(height: 45)
                        .background(Color("_ECF1FF"))
                        .cornerRadius(8)
                }
                VStack(alignment: .leading, spacing: 8){
                    Text("Password")
                        .font(.custom("LeagueSpartan-Medium", size: 20))
                    VStack(alignment: .trailing, spacing: 8) {
                        TextField("Emter your password", text: $password)
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .frame(height: 45)
                            .background(Color("_ECF1FF"))
                            .cornerRadius(8)
                        
                        Text("Forget Password?")
                    }
                        
                }
                
                Button {
                    
                } label: {
                    VStack {
                        Text("Log In")
                            .font(.custom("LeagueSpartan-Medium", size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 45)
                    .background(Color("_2260FF"))
                    .cornerRadius(8)
                }
            }
            
           Text("Or sign up with")
            
            

            
        }
        .padding(.horizontal,16)
    }
}

#Preview {
    LoginView()
}

//
//  ForgotPasswordView.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Reset password")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundColor(Color("_2260FF"))
                
                Text("Please enter your email to reset the password")
                    .font(.custom("LeagueSpartan-Light", size: 18))
                
                
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
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Text("Reset Password")
                                .font(.custom("LeagueSpartan-Medium", size: 20))
                                .foregroundColor(.white)
                        }
                        
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color("_2260FF"))
                        .cornerRadius(8)
                    }
                    .padding(.vertical, 20)
                }
                .padding(.vertical, 20)
            }
            
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Forgot password")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}

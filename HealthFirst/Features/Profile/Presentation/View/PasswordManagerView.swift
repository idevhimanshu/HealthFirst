//
//  PasswordManagerView.swift
//  HealthFirst
//
//  Created by chetu on 07/10/26.
//

import SwiftUI

struct PasswordManagerView: View {
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var isNavigateToForgotPasswordView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .trailing, spacing: 8){
                CustomTextField(textFieldTitle: "Current Password", isSecure: true, text: $currentPassword)
                Button {
                    isNavigateToForgotPasswordView.toggle()
                } label: {
                    Text("Forget Password?")
                }
            }
            
            CustomTextField(textFieldTitle: "New Password", isSecure: true, text: $newPassword)
            CustomTextField(textFieldTitle: "Confirm New Password", isSecure: true, text: $confirmPassword)
        }
        .padding(16)
        .navigationDestination(isPresented: $isNavigateToForgotPasswordView, destination: {
            ForgotPasswordView()
        })
    }
}

#Preview {
    PasswordManagerView()
}

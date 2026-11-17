//
//  EditProfileView.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var name: String = ""
    @State private var mobileNumber: String = ""
    @State private var email: String = ""
    @State private var dateOfBirth: String = ""
    @State private var isNavigateToSettingView: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            ProfileImageView()
                .padding(.bottom, 20)
            CustomTextField(textFieldTitle: "Full Name", text: $name)
            CustomTextField(textFieldTitle: "Phone number", text: $mobileNumber)
            CustomTextField(textFieldTitle: "Email", text: $email)
            CustomTextField(textFieldTitle: "Date of birth", text: $dateOfBirth)
            Spacer()
            CustomButton {
                
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .navigationDestination(isPresented: $isNavigateToSettingView, destination: {
            SettingView()
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isNavigateToSettingView.toggle()
                }) {
                    Image("setting_icon")
                }
            }
        }
        

    }
}

#Preview {
    EditProfileView()
}

struct CustomButton: View {
    
    let action: () -> ()
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                Text("Update Profile")
                    .font(.custom("LeagueSpartan-Medium", size: 24))
                    .foregroundColor(.white)
                
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("_2260FF"))
            .cornerRadius(30)
        }

    }
}

//
//  CustomTextField.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI

struct CustomTextField: View {
    let textFieldTitle: String
    var isSecure: Bool? = false
    @Binding public var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(textFieldTitle)
                .font(.custom("LeagueSpartan-Regular", size: 20))
            if let isSecure = isSecure, !isSecure  {
               
                    TextField("", text: $text)
                        .frame(height: 45)
                        .background(Color("_ECF1FF"))
                        .cornerRadius(13)
                        .font(.custom("LeagueSpartan-Regular", size: 20))
            } else {
                ZStack(alignment: .trailing) {
                    SecureField("", text: $text)
                        .frame(height: 45)
                        .background(Color("_ECF1FF"))
                        .cornerRadius(13)
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                    
                    Image("close_eye_icon")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding(.trailing, 16)
                }
            }
            
            
        }
    }
}


#Preview {
    CustomTextField(textFieldTitle: "Full Name", text: .constant(""))
}

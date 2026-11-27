//
//  ProfileImageView.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI

struct ProfileImageView: View {
    
    var selectedImage: UIImage? = nil
    var editButtonAction: () -> Void
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .frame(width: 110, height: 110)
                    .cornerRadius(55)
            } else {
                Image("ProfilePhoto")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .cornerRadius(55)
            }
            
            Button(action: {
                   editButtonAction()
                }) {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(Color("_2260FF"))
                        .overlay {
                            Image("pencil_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                                .foregroundColor(.white)
                        }
                }
                .buttonStyle(.plain)
                .offset(x: -6, y: -6)
        }
    }
}

#Preview {
    ProfileImageView(editButtonAction: {
        
    })
}

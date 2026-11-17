//
//  ReviewScreen.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct ReviewScreen: View {
    @State private var reviewTextField: String = ""
    var body: some View {
        VStack(spacing: 16) {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.custom("LeagueSpartan-Light", size: 14))
            VStack(spacing: 12) {
                Image("ProfilePhoto")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .cornerRadius(65)
                
                Text("Dr. Olivia Turner, M.D.")
                    .font(.custom("LeagueSpartan-Medium", size: 24))
                    .foregroundStyle(Color("_2260FF"))
                
                Text("Dermato-Endocrinology")
                    .font(.custom("LeagueSpartan-Light", size: 15))
                
                CircleButton(size: 22, icon: "Heart", iconSize: 10, theme: .custom) {
                    
                }
            }
            HStack {
                TextField("Enter your comment here..", text: $reviewTextField, axis: .vertical)
                    .lineLimit(7, reservesSpace: true)
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                    
            }
            .padding(16)
            .background(Color("_CAD6FF"))
            .cornerRadius(18)
            
            CustomButton {
                
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Review")
                    .font(.custom("LeagueSpartan-Semibold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }
        
    }
}

#Preview {
    ReviewScreen()
}

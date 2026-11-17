//
//  SuccessScreenView.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import SwiftUI

struct SuccessScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("success_icon")
                .resizable()
                .frame(width: 172, height: 172)
                .foregroundStyle(Color("_FFFFFF"))
                .padding(.bottom, 32)
            
            Text("Congratulation")
                .font(.custom("LeagueSpartan-SemiBold", size: 40))
                .foregroundStyle(Color("_FFFFFF"))
                .padding(.bottom, 14)
            
            Text("Payment is Successfully")
                .font(.custom("LeagueSpartan-Medium", size: 24))
                .foregroundStyle(Color("_FFFFFF"))
            
            Spacer()
            
            VStack {
                Text("You have successfully booked an appointment with")
                    .font(.custom("LeagueSpartan-Light", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("_FFFFFF"))
                    .padding(.bottom, 22)
                
                Text("Dr. Olivia Turner, M.D.")
                    .font(.custom("LeagueSpartan-Bold", size: 20))
                    .foregroundStyle(Color("_FFFFFF"))
                
                HStack(spacing: 0) {
                    AppBadge(icon: "calender_icon", title: "Month 24, Year", theme: .clear)
                    
                    AppBadge(icon: "calender_icon", title: "Month 24, Year", theme: .clear)
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 16)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("_FFFFFF"), lineWidth: 1)
            }
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("_2260FF"))
    }
}

#Preview {
    SuccessScreenView()
}

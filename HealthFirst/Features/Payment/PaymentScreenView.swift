//
//  PaymentScreenView.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import SwiftUI

struct PaymentScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("$ 100.00")
                .font(.custom("LeagueSpartan-Bold", size: 40))
                .foregroundStyle(Color("_FFFFFF"))
            Spacer()
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("_2260FF"))
        
        VStack {
            HStack(spacing: 14) {
                
                Image("ProfilePhoto")
                    .resizable()
                    .frame(width: 84, height: 84)
                    .cornerRadius(42)
                VStack(alignment: .leading) {
                    Text("Dr. Olivia Turner, M.D.")
                        .font(.custom("LeagueSpartan-Medium", size: 16))
                        .foregroundStyle(Color("_2260FF"))
                    
                    Text("Dermato-Endocrinology")
                        .font(.custom("LeagueSpartan-Light", size: 12))
                    HStack {
                        AppBadge(icon: "star", title: "5", theme: .custom)
                        AppBadge(icon: "review_icon", title: "60", theme: .custom)
                        Spacer()
                    }
                }
                
            }
            .padding(.vertical, 25)
            
            HStack {
                
            }
            .frame(maxWidth: .infinity, minHeight: 1, alignment: .center)
            .background(Color("_2260FF"))
            
            VStack(spacing: 14) {
                ForEach(0..<3) { _ in
                    HStack {
                        Text("Date / Hour")
                            .font(.custom("LeagueSpartan-Regular", size: 13))
                            .foregroundStyle(Color("_4378FF"))
                        
                        Spacer()
                        Text("Month 24, Year / 10:00 aM")
                            .font(.custom("LeagueSpartan-Medium", size: 13))
                    }
                }
            }
            .padding(.vertical, 25)
            
            HStack {
                
            }
            .frame(maxWidth: .infinity, minHeight: 1, alignment: .center)
            .background(Color("_2260FF"))
            
            VStack(spacing: 14) {
                ForEach(0..<3) { _ in
                    HStack {
                        Text("Date / Hour")
                            .font(.custom("LeagueSpartan-Regular", size: 13))
                            .foregroundStyle(Color("_4378FF"))
                        
                        Spacer()
                        Text("Month 24, Year / 10:00 aM")
                            .font(.custom("LeagueSpartan-Medium", size: 13))
                    }
                }
            }
            .padding(.vertical, 25)
            
            HStack {
                
            }
            .frame(maxWidth: .infinity, minHeight: 1, alignment: .center)
            .background(Color("_2260FF"))
            
            VStack(spacing: 14) {
                ForEach(0..<1) { _ in
                    HStack {
                        Text("Payment Method")
                            .font(.custom("LeagueSpartan-Regular", size: 13))
                            .foregroundStyle(Color("_4378FF"))
                        
                        Spacer()
                        
                        Text("Card")
                            .font(.custom("LeagueSpartan-Medium", size: 13))
                        Text("Change")
                            .font(.custom("LeagueSpartan-Medium", size: 13))
                            .foregroundStyle(Color("_4378FF"))
                    }
                }
            }
            .padding(.vertical, 25)
            
            Spacer()
            CustomButton {
                
            }
            
            Spacer()
        }
        .padding(16)
        
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Payment")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_FFFFFF"))
            }
        }
    }
}

#Preview {
    PaymentScreenView()
}


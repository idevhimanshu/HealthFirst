//
//  PaymentMethodView.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import SwiftUI

struct PaymentMethodView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 13) {
                Text("Credit & Debit Card")
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                    .foregroundStyle(Color("_000000"))
                
                CustomPaymentMethodButton()
            }
            .padding(.bottom, 35)
            
            VStack(alignment: .leading, spacing: 13) {
                Text("Credit & Debit Card")
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                    .foregroundStyle(Color("_000000"))
                
                VStack(spacing: 8) {
                    
                    CustomPaymentMethodButton()
                    CustomPaymentMethodButton()
                    CustomPaymentMethodButton()
                }
            }
            
            
        }
        .padding(.horizontal, 16)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Payment Method")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }
    }
}

#Preview {
    PaymentMethodView()
}

struct CustomPaymentMethodButton: View {
    var body: some View {
        HStack {
            Image("card_icon")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color("_2260FF"))
            
            Text("Add New Card")
                .font(.custom("LeagueSpartan-Regular", size: 20))
                .foregroundStyle(Color("_809CFF"))
            
            Spacer()
            CustomRadioButton(isSelected: false, action: {
                
            })
            
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("_ECF1FF"))
        .cornerRadius(20)
    }
}

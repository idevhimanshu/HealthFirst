//
//  AddCardView.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import SwiftUI

struct AddCardView: View {
    var body: some View {
        VStack(spacing: 24){
            HStack {
                Image("card_image")
                    .resizable()
                    .scaledToFit()
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(Color("_2260FF"))
            .cornerRadius(16)
            .padding(.bottom, 27)
            
            PaymentMethodTextField()
            PaymentMethodTextField()
            
            HStack(spacing: 8) {
                PaymentMethodTextField()
                PaymentMethodTextField()
            }
            
            Spacer()
            CustomButton {
                
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Add Card")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }
    }
}

struct PaymentMethodTextField: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("Card holder name")
                .font(.custom("LeagueSpartan-Regular", size: 18))
                .foregroundStyle(Color("_000000"))
            
                TextField("", text: .constant(""), prompt: Text("John Doe")
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                    .foregroundStyle(Color("_809CFF"))
                )
                .padding(.vertical, 16)
                .padding(.horizontal, 27)
                .font(.custom("LeagueSpartan-Regular", size: 20))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color("_ECF1FF"))
                .foregroundStyle(Color("_809CFF"))
                .cornerRadius(20)
        }
    }
}

#Preview {
    AddCardView()
}

//
//  FilterTabButton.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct FilterTabButton: View {
    
    let title: String
    var isSelected: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .font(.custom("LeagueSpartan-Regular", size: 16))
                    .foregroundStyle(isSelected ? Color.white : Color("_2260FF"))
                
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(isSelected ? "_2260FF" : "_CAD6FF"))
            .cornerRadius(22)
        }
        .animation(.easeInOut, value: isSelected)
    }
}

#Preview {
    FilterTabButton(title: "Upcoming", action: { })
}

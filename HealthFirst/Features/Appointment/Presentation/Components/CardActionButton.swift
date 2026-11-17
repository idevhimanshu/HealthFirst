//
//  CardActionButton.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct CardActionButton: View {
    let title: String
    let theme: ButtonTheme
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .font(.custom("LeagueSpartan-Regular", size: 20))
                    .foregroundStyle(theme.textColor)
                
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(theme.baseColor)
            .cornerRadius(22)
        }
    }
}

#Preview {
    CardActionButton(title: "Re-Book", theme: ButtonTheme.primary, action: {
        
    })
}

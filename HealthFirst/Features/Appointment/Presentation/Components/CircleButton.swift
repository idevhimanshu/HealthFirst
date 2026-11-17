//
//  CircleButton.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct CircleButton: View {
    let size: CGFloat
    let icon: String
    let iconSize: CGFloat
    var theme: ButtonTheme = .white
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(theme.baseColor)
                .overlay {
                    Image(icon)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
        }
        .buttonStyle(.plain)
        
    }
}

#Preview {
    CircleButton(size: 22, icon: "Heart", iconSize: 10){
        
    }
}

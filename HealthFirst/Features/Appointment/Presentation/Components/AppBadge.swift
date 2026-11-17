//
//  AppBadge.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct AppBadge: View {
    var icon: String
    var title: String
    var theme: ButtonTheme = .white
    
    var body: some View {
        HStack {
            
            Image(icon)
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundStyle(theme.textColor)
            HStack {
                Text(title)
                    .font(.custom("LeagueSpartan-Light", size: 12))
                    .foregroundStyle(theme.textColor)
            }
            .padding(.top, 3)
            
        }
        .padding(5)
        .padding(.horizontal, 8)
//        .frame(maxWidth: .infinity, alignment: .center)
        .background(theme.baseColor)
        .cornerRadius(13)
    }
}

#Preview {
    AppBadge(icon: "heart", title: "Favourite")
}

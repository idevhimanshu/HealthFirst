//
//  SettingView.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI

struct SettingView: View {
    
    @State private var buttonName: [MenuItem] = [MenuItem(title: "Notification Setting", iconName: "bulb_icon"), MenuItem(title: "Password Manager", iconName: "key_icon"), MenuItem(title: "Delete Account", iconName: "profile_icon")]
    @State private var isNavigateToNotificationSettingView: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(buttonName){ menu in
                HStack(spacing: 20) {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("_CAD6FF"))
                        .overlay{
                            Image(menu.iconName)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .scaledToFit()
                                .foregroundColor(Color("_2260FF"))
                        }
                    
                    Text(menu.title)
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                    
                    Spacer()
                    
                    Image("RightArrow")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color("_2260FF"))
                }
                .onTapGesture {
                    isNavigateToNotificationSettingView.toggle()
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
        .navigationBarTitle("Settings")
        .navigationDestination(isPresented: $isNavigateToNotificationSettingView) {
            NotificationSettingView()
        }
    }
}

#Preview {
    SettingView()
}

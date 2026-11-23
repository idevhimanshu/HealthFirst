//
//  CustomTabBarView.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import SwiftUI

enum TabItems {
    case home
    case chat
    case profile
    case calender
}

struct CustomTabBarView: View {
    
    @State private var selectedTab: TabItems = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                switch selectedTab {
                case .home:
                    HomeView()
                case .chat:
                    SignUpView()
                case .profile:
                    ProfileView()
                case .calender:
                    AllAppointmentView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            VStack {
                HStack {
                    
                    Spacer()
                    
                    TabBarButton(image: "Home", action: {
                        selectedTab = .home
                    }, isSelected: selectedTab == .home)
                    
                    Spacer()
                    
                    TabBarButton(image: "Chat", action: {
                        selectedTab = .chat
                    }, isSelected: selectedTab == .chat)
                    
                    Spacer()
                    
                    
                    TabBarButton(image: "Profile", action: {
                        selectedTab = .profile
                    }, isSelected: selectedTab == .profile)
                    
                    Spacer()
                    
                    TabBarButton(image: "calender_icon",action: {
                        selectedTab = .calender
                    }, isSelected: selectedTab == .calender)
                    
                    Spacer()
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color("_2260FF"))
                .cornerRadius(24)
            }
            .padding(.horizontal, 16)
        }

        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    CustomTabBarView()
}

struct TabBarButton: View {
    
    let image: String
    let action: () ->()
    let isSelected: Bool
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 23, height: 23)
            .scaledToFit()
            .onTapGesture {
                action()
            }
            .foregroundColor(isSelected ? .black : .white)
    }
}

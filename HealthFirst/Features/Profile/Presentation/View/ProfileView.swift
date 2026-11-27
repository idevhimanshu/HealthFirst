//
//  ProfileView.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI
import PhotosUI

struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
//    let action: () -> Void
}

protocol changeProfileImage {
    func changeProfileImage() -> UIImage
}

struct ProfileView: View {
    
    @State private var buttonName: [MenuItem] = [MenuItem(title: "Profile", iconName: "profile_icon"), MenuItem(title: "Favorite", iconName: "favorite_icon"), MenuItem(title: "Payment Method", iconName: "wallet_icon"), MenuItem(title: "Privacy Policy", iconName: "lock_icon"), MenuItem(title: "Settings", iconName: "setting_icon"), MenuItem(title: "Help", iconName: "help_icon"), MenuItem(title: "Logout", iconName: "logout_icon")]
    
    @State private var isShowActionSheet: Bool = false
    
    @State private var settingViewModel: SettingViewModel = SettingViewModel(settingUseCases: SettingUseCases(settingRepository: SettingRepositoryImpl(keychainManager: KeychainManager.shared, networkManager: NetworkManger.shared), keychainManager: KeychainManager.shared))
    @State private var isNavigateToEditProfileView: Bool = false
    @Environment(NavigationViewModel.self) private var navigationViewModel
    
    var body: some View {
        ZStack {
            VStack {
                
                ProfileImageView(){ }
                
                Text("John Doe")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                
                
                Spacer()
                
                VStack(spacing: 16){
                    
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
                        }
                        .onTapGesture {
//                            isShowActionSheet.toggle()
                            navigationViewModel.goNextScreen(screen: .editProfileView)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            VStack{
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(isShowActionSheet ? Color("_2260FF").opacity(0.54) : .clear)
        }
        
        .navigationDestination(isPresented: $isNavigateToEditProfileView) {
            EditProfileView()
        }
        
        .sheet(isPresented: $isShowActionSheet) {
            VStack(spacing: 20) {
                Text("Logout")
                    .font(.custom("LeagueSpartan-Medium", size: 24))
                    .foregroundColor(Color("_2260FF"))
                
                Text("Are you sure you want to logout?")
                    .font(.custom("LeagueSpartan-Regular", size: 16))
                    .foregroundColor(Color("_000000"))
                HStack {
                    HStack {
                        Text("Cancel")
                            .font(.custom("LeagueSpartan-Medium", size: 20))
                            .foregroundStyle(Color("_2260FF"))
                    }
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .background(Color("_CAD6FF"))
                    .cornerRadius(20)
                    
                    Button {
                        isShowActionSheet = false
                        Task {
                            if await settingViewModel.logout(){
                                navigationViewModel.setRoot(screen: .login)
                            } else {
                                
                            }
                        }
                    } label: {
                        HStack {
                            Text("Yes, Logout")
                                .font(.custom("LeagueSpartan-Medium", size: 20))
                                .foregroundStyle(Color("_FFFFFF"))
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .top)
                        .background(Color("_2260FF"))
                        .cornerRadius(20)
                        .overlay {
                            if settingViewModel.isLoading {
                                ProgressView()
                                    .tint(.white)
                            }
                        }
                    }
                    
                    
                }
                
            }
            .padding([.horizontal, .bottom], 24)
            .presentationDetents([.height(180)])
            .presentationDragIndicator(.hidden)
            
        }

        
        
        
        .alert(isPresented: $settingViewModel.isShowAlert) {
            Alert(title: Text("Error"), message: Text(settingViewModel.alertMessage), dismissButton: .cancel(Text("Ok")))
        }
        
    }
}

#Preview {
    ProfileView()
}




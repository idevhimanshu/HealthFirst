//
//  EditProfileView.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI
enum ActivePicker: Identifiable {
    case camera, gallery
    var id: Self { self }
}


struct EditProfileView: View {
    
    @State private var name: String = ""
    @State private var mobileNumber: String = ""
    @State private var email: String = ""
    @State private var dateOfBirth: String = ""
    @State private var isNavigateToSettingView: Bool = false
    
    @State private var isShowPhotoPickerSheet: Bool = false
    @State private var selectedImage: UIImage?
    @State private var activePicker: ActivePicker?
    @State private var settingViewModel: SettingViewModel = SettingViewModel(settingUseCases: SettingUseCases(settingRepository: SettingRepositoryImpl(keychainManager: KeychainManager.shared, networkManager: NetworkManger.shared), keychainManager: KeychainManager.shared))
    
    var body: some View {
        VStack(spacing: 16) {
            ProfileImageView(selectedImage: selectedImage, editButtonAction: {
                isShowPhotoPickerSheet = true
            })
            .padding(.bottom, 20)
            
            CustomTextField(textFieldTitle: "Full Name", text: $name)
            CustomTextField(textFieldTitle: "Phone number", text: $mobileNumber)
            CustomTextField(textFieldTitle: "Email", text: $email)
            CustomTextField(textFieldTitle: "Date of birth", text: $dateOfBirth)
            
            Spacer()
            
            CustomButton {
                if let selectedImage = selectedImage {
                    Task {
                     await settingViewModel.changeProfile(image: selectedImage)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isNavigateToSettingView.toggle()
                }) {
                    Image("setting_icon")
                }
            }
        }
        // 1. Clean Bottom Sheet (Native iOS Look)
        .sheet(isPresented: $isShowPhotoPickerSheet) {
            NavigationStack {
                List {
                    Button {
                        isShowPhotoPickerSheet = false
                        activePicker = .camera
                    } label: {
                        Label("Camera", systemImage: "camera")
                    }
                    
                    Button {
                        isShowPhotoPickerSheet = false
                        activePicker = .gallery
                    } label: {
                        Label("Gallery", systemImage: "photo.on.rectangle")
                    }
                }
                .navigationTitle("Select any one")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Cancel") {
                            isShowPhotoPickerSheet = false
                        }
                    }
                }
            }
            .presentationDetents([.height(210)]) // Hamesha bottom mein khulega
            .presentationDragIndicator(.visible)
        }
        // 2. Camera / Gallery Sheet (Bina kisi delay ke)
        .sheet(item: $activePicker) { picker in
            ImagePicker(
                selectedImage: $selectedImage,
                sourceType: picker == .camera ? .camera : .photoLibrary
            )
            .ignoresSafeArea()
        }
    }
}


#Preview {
    EditProfileView()
}

struct CustomButton: View {
    
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text("Update Profile")
                    .font(.custom("LeagueSpartan-Medium", size: 24))
                    .foregroundColor(.white)
                
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("_2260FF"))
            .cornerRadius(30)
        }

    }
}

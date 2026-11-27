//
//  SettingViewModel.swift
//  HealthFirst
//
//  Created by Himanshu on 22/11/26.
//

import Foundation
import UIKit

@Observable
final class SettingViewModel {
    
    let settingUseCases: SettingUseCases
    var alertTitle: String = ""
    var alertMessage: String = ""
    var isShowAlert: Bool = false
    var isLoading: Bool = false
    var isNavigateToLoginScreen: Bool = false
    var selectedImage: UIImage? = nil
    
    init(settingUseCases: SettingUseCases) {
        self.settingUseCases = settingUseCases
    }
    
    func logout() async -> Bool {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            return try  await settingUseCases.logout()
            //            if isLogout {
            //                isNavigateToLoginScreen = true
            //            }
        } catch let error as NetworkError {
            switch error {
            case .invalidUrl:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .noInternet:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .unauthorized:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .serverError(_, let messsage):
                alertMessage = messsage
                isShowAlert.toggle()
            case .decodingError:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .requestFaild(_):
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .unknown:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            }
        } catch {
            alertMessage = error.localizedDescription
            isShowAlert.toggle()
            print(error.localizedDescription)
        }
        return false
    }
    
    func changeProfile(image: UIImage) async {
        do {
            let imageData = try imageToData(image: image)
            let avatarFile = MultipartFile(
                data: imageData,
                fieldName: "file",
                fileName: "profile.jpg",
                mimeType: "image/jpeg"
            )
            _ = try await settingUseCases.changeImage(data: imageData, file: avatarFile)
        } catch let error as NetworkError {
            switch error {
            case .invalidUrl:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .noInternet:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .unauthorized:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .serverError(_, let messsage):
                alertMessage = messsage
                isShowAlert.toggle()
            case .decodingError:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .requestFaild(_):
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            case .unknown:
                alertMessage = error.localizedDescription
                isShowAlert.toggle()
            }
        } catch {
            alertMessage = error.localizedDescription
            isShowAlert.toggle()
            print(error.localizedDescription)
        }
    }
    
    
    func imageToData(image: UIImage) throws -> Data {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            throw NetworkError.invalidUrl
        }
        return imageData
    }
}

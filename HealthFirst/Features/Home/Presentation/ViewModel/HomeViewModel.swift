//
//  HomeViewModel.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation

@Observable
final class HomeViewModel {
    
    private let homeUseCasesProtocol: HomeUseCasesProtocol
    var isLoading: Bool = false
    var alertMessage: String = ""
    var isShowAlert = false
    var doctorList: [Doctor] = []
    
    
    init(homeUseCasesProtocol: HomeUseCasesProtocol) {
        self.homeUseCasesProtocol = homeUseCasesProtocol
    }
    
    func getDoctorList() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
             doctorList = try await homeUseCasesProtocol.getDoctorList(endpoints: HomeEndpoints.getDoctorList)
           
        } catch let error as NetworkError {
            switch error {
            case .invalidUrl:
                alertMessage = error.errorDescription
                isShowAlert.toggle()
            case .noInternet:
                alertMessage = error.errorDescription
                isShowAlert.toggle()
            case .unauthorized:
                alertMessage = error.errorDescription
                isShowAlert.toggle()
            case .serverError(_, let messsage):
                alertMessage = messsage
                isShowAlert.toggle()
            case .decodingError:
                alertMessage = error.errorDescription
                isShowAlert.toggle()
            case .requestFaild(_):
                alertMessage = error.errorDescription
                isShowAlert.toggle()
            case .unknown:
                alertMessage = error.errorDescription
                isShowAlert.toggle()
            }
        } catch {
            alertMessage = error.localizedDescription
            isShowAlert.toggle()
        }
    }
    
    func getUserDetails() {
        
    }

}

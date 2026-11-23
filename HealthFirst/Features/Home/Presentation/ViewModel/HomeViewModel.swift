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
    
    
    init(homeUseCasesProtocol: HomeUseCasesProtocol) {
        self.homeUseCasesProtocol = homeUseCasesProtocol
    }
    
    func getDoctorList() async {
        do {
            let doctorList = try await homeUseCasesProtocol.getDoctorList(endpoints: HomeEndpoints.getDoctorList)
            print(doctorList)
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
        }
    }

}

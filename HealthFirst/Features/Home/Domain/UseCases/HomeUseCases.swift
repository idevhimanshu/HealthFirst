//
//  HomeUseCases.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation

protocol HomeUseCasesProtocol {
    func getDoctorList(endpoints: APIEndpoints) async throws -> [DoctorList]
}

class HomeUseCases: HomeUseCasesProtocol {
    
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func getDoctorList(endpoints: APIEndpoints) async throws -> [DoctorList] {
       return try await homeRepository.getDoctorList(endpoints: endpoints)
    }
}

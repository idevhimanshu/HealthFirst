//
//  HomeUseCases.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation

protocol HomeUseCasesProtocol {
    func getDoctorList(endpoints: APIEndpoints) async throws -> [Doctor]
}

class HomeUseCases: HomeUseCasesProtocol {
    
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func getDoctorList(endpoints: APIEndpoints) async throws -> [Doctor] {
       return try await homeRepository.getDoctorList(endpoints: endpoints)
    }
}

//
//  HomeRepositoryImpl.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation

class HomeRepositoryImpl: HomeRepositoryProtocol {
    
    private let networkManager: NetworkManger
    
    init(networkManager: NetworkManger) {
        self.networkManager = networkManager
    }
    
    func getDoctorList(endpoints: APIEndpoints) async throws -> [DoctorList] {
        let response: Result<[DoctorList], NetworkError> = await networkManager.sendRequest(endpoint: endpoints.path)
        switch response {
        case .success(let doctorList):
            return doctorList
        case .failure(let error):
            throw error
        }
        
    }
    
    
}

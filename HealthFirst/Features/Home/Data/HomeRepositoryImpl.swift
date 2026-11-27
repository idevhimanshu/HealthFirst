//
//  HomeRepositoryImpl.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation
import Alamofire

class HomeRepositoryImpl: HomeRepositoryProtocol {
    
    
    private let networkManager: NetworkManger
    
    init(networkManager: NetworkManger) {
        self.networkManager = networkManager
    }
    
    func getDoctorList(endpoints: APIEndpoints) async throws -> [Doctor] {
        let response: Result<[Doctor], NetworkError> = await networkManager.sendRequest(endpoint: endpoints.path)
        switch response {
        case .success(let doctorList):
            return doctorList
        case .failure(let error):
            throw error
        }
        
    }
    
    func getUserDetail(endPoints: APIEndpoints) async throws -> UserDetails {
        let response: Result<UserDetails, NetworkError> = await networkManager.sendRequest(endpoint: endPoints.path)
        switch response {
        case .success(let userDetails):
            return userDetails
        case .failure(let failure):
            throw failure
        }
    }
    
    func searchDoctors(endpoints: APIEndpoints) async throws -> [Doctor] {
        let response: Result<[Doctor], NetworkError> = await networkManager.sendRequest(endpoint: endpoints.path, parameter: endpoints.parameter, method: .get)
        switch response {
        case .success(let doctorsList):
            return doctorsList
        case .failure(let failure):
            throw failure
        }
    }
    
    
}

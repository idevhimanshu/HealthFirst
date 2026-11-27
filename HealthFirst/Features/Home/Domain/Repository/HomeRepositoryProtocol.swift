//
//  HomeRepositoryProtocol.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation
protocol HomeRepositoryProtocol {
    func getDoctorList(endpoints: APIEndpoints) async throws -> [Doctor]
    func getUserDetail(endPoints: APIEndpoints) async throws -> UserDetails
    func searchDoctors(endpoints: APIEndpoints) async throws -> [Doctor]
}

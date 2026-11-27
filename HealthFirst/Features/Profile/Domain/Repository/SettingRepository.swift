//
//  SettingRepository.swift
//  HealthFirst
//
//  Created by Himanshu on 22/11/26.
//

import Foundation
protocol SettingRepository {
    func logout(endpoint: APIEndpoints) async throws -> Bool
    func changedProfileImage(endpoint: APIEndpoints) async throws -> Bool
}

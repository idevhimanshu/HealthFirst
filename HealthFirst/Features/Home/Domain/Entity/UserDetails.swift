//
//  UserDetails.swift
//  HealthFirst
//
//  Created by chetu on 25/11/26.
//

import Foundation
nonisolated struct UserDetails: Codable, Sendable {
    let id: Int
    let name: String
    let gender: String?
}

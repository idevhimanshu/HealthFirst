//
//  DoctorList.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation
struct DoctorList: Codable, Sendable {
    let id: Int
    let specialization: String?
    let qualification: String?
    let licenseNumber: String?
    let experienceyear: Int?
    let consultantFee: Int?
    let hospitalName: String?
    let address: String?
    let city: String?
    let bio: String?
    let user: User?
}

struct User: Codable, Sendable {
    let id: Int
    let name: String?
    let mobileNumber: String?
    let email: String?
    let password: String?
    let role: String?
    let image: String?
}

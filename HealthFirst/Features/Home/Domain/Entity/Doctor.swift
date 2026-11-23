//
//  DoctorList.swift
//  HealthFirst
//
//  Created by chetu on 18/11/26.
//

import Foundation

nonisolated struct Doctor: Codable, Sendable {
        
        let id: Int
        let gender: String?
        let specializaiton: String
        let rating: Int
        let favorite: Bool
        let image: String?
        let name: String
        let commentCount: Int

}

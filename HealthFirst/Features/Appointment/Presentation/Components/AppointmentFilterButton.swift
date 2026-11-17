//
//  AppointmentFilterButton.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import Foundation

enum AppointmentFilterButton: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case completed = "Completed"
    case upcoming = "Upcoming"
    case cancelled = "Cancelled"
    
    
}

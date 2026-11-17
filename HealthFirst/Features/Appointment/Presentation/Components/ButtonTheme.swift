//
//  ButtonTheme.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

enum ButtonTheme {
    
    case primary
    case white
    case custom
    case clear
    
    var baseColor: Color {
        switch self {
        case .primary:
            return Color("_2260FF")
        case .white:
            return Color("_FFFFFF")
        case .custom:
            return Color("_CAD6FF")
        case .clear:
            return Color.clear
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary:
            return Color("_FFFFFF")
        case .white:
            return Color("_2260FF")
        case .custom:
            return Color("_2260FF")
        case .clear:
            return Color("_FFFFFF")
        }
    }
}

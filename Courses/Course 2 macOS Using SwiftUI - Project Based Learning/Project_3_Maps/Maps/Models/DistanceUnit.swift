//
//  DistanceUnit.swift
//  Maps
//
//  Created by Maksym Poskannyi on 04.06.2025.
//

import Foundation

enum DistanceUnit: String, Codable, CaseIterable {
    case miles
    case kilometers  
}

extension DistanceUnit {
    var title: String {
        switch self {
        case .miles:
            return "mi"
        case .kilometers:
            return "km"
        }
    }
}

//
//   View+Extensions.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation
import SwiftUI

extension View {
    func changeColor(_ change: String) -> Color {
        guard let value = Double(change) else {
            return .green
        }
        
        return value < 0 ? .red : Color(red: 0.25, green: 0.8, blue: 0.25)
    }
}

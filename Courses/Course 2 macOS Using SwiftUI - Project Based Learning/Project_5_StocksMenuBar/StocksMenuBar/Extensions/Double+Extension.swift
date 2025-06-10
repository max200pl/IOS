//
//  Double+Extension.swift
//  StocksMenuBar
//
//  Created by Maksym Poskannyi on 10.06.2025.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "N/A"
    }
}

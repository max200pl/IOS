//
//  Stock.swift
//  StocksMenuBar
//
//  Created by Maksym Poskannyi on 10.06.2025.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
}

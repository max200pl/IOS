//
//  Stock.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

struct Stock: Decodable {
    
    let symbol: String
    let description: String
    let price: Double
    let change: String
}

extension Stock {
    
    static func fromVM(_ vm: StockViewModel) -> Stock {
        Stock(symbol: vm.symbol, description: vm.name, price: vm.price, change: vm.change)
    }
    
}

//
//  StockViewModel.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

struct StockViewModel: Identifiable, Equatable {
    static func == (lhs: StockViewModel, rhs: StockViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    private var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    let id = UUID()
    
    var name: String {
        stock.description
    }
    
    var symbol: String {
        stock.symbol
    }
    
    var price: Double {
        stock.price
    }
    
    var change: String {
        stock.change
    }
    
    
}

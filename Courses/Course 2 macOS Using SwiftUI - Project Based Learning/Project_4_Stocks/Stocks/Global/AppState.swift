//
//  AppState.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

class AppState: ObservableObject {
    @Published var stocks: [StockViewModel] = []
    @Published var route: Route = .businessArticles
    
    func stockBySymbol(_ symbol: String) -> StockViewModel? {
        
        guard let stock = (stocks.first { $0.symbol == symbol }) else {
            return nil
        }
        
        return stock
    }
    
}

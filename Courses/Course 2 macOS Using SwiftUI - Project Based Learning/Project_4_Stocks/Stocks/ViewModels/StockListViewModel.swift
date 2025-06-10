//
//    StockListViewModel.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

@MainActor
class StockListViewModel: ObservableObject {

    let stockState: StocksState
    
    init(stockState: StocksState) {
        self.stockState = stockState
    }
    
    var stocks: [StockViewModel] {
        stockState.stocks
    }
    
     func getStocks() async {
        do {
            let stocks = try await Webservice().fetchStocks()
            stockState.stocks = stocks.map(StockViewModel.init)
        } catch {
            print(error)
        }
    }
}

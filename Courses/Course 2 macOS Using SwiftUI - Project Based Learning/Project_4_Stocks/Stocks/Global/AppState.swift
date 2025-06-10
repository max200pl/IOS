//
//  AppState.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

class AppState: ObservableObject {
    var stockState: StocksState
    var routeState: RouteState
    
    init(stockState: StocksState = StocksState(), routeState: RouteState = RouteState()) {
        self.stockState = stockState
        self.routeState = routeState
    }
    
}

class StocksState: ObservableObject {
    @Published var stocks: [StockViewModel] = []
    
    func stockBySymbol(_ symbol: String) -> StockViewModel? {
        
        guard let stock = (stocks.first { $0.symbol == symbol }) else {
            return nil
        }
        
        return stock
    }
}

class RouteState: ObservableObject {
    var routes:[Route] = []
    @Published var route: Route = .businessArticles
    
    
    func push(_ route: Route) {
        routes.append(route)
        self.route = route
    }
    
    func pop() -> Route? {
        return routes.popLast()
    }
}

//
//  StockListView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct StockListView: View {
    let stocks: [StockViewModel]
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        List {
            
            BussinesNewsHeaderView()
            
            ForEach(stocks) { stock in
                StockCellView(stock: stock) { selectedStock in
                    print(selectedStock)
                    // set the route
                    appState.route = .stockDetail(selectedStock)
                }
            }
            
        }
    }
}


#Preview {
    let stock = Stock(symbol: "GOOG", description: "Google Innovation Media",  price: 50, change: "+3.24",  )
    
    let stock2 = Stock(symbol: "APLE", description: "Apple",  price: 172, change: "-0.24",  )
    
    StockListView(stocks: [StockViewModel(stock: stock), StockViewModel(stock: stock2)])
        .frame(maxWidth: 300)

}

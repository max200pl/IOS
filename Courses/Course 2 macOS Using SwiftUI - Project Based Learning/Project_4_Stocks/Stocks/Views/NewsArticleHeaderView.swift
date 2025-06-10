//
//  NewsArticleHeaderView.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/27/22.
//

import SwiftUI

struct NewsArticleHeaderView: View {
    
    @EnvironmentObject private var stockState: StocksState
    let symbol: String
    
    var body: some View {
        
        if let stock = stockState.stockBySymbol(symbol) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Text(stock.symbol)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                    
                    Text("\(stock.price, specifier: "%.2f")")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                }
                Text(stock.name)
                    .opacity(0.4)
                Spacer()
            }.padding()
        } else {
            EmptyView()
        }
        
    }
}

struct NewsArticleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleHeaderView(symbol: "GOOG")
    }
}

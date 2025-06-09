//
//  StockDetailScreen.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 07.06.2025.
//

import SwiftUI

struct StockDetailScreen: View {
    
    let stock: StockViewModel
    @StateObject private var vm = StockDetailViewModel()
    @EnvironmentObject private var app: AppState
    

   
    var body: some View {
        
        ScrollView {
            VStack {
                
                NewsArticleHeaderView(symbol: stock.symbol)
                ArticlesGridView(articles: vm.articles)
            }.task(id: stock) {
                await vm.fetchArticlesByStock(stock: stock)
            }
        }
    }
}

#Preview {
    let stockVM = StockViewModel(stock: Stock(symbol: "Apple", description: "All Apple Inc.", price: 184, change: "+3.42"))
    
    return StockDetailScreen(stock: stockVM)
}

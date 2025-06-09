//
//  NewsAricleListScreen.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct NewsArticleListScreen: View {
    
    @StateObject private var vm = StockArticleListViewModel()
    
    var body: some View {
        ScrollView {
            Text("Top Stories")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            NewsArticleListView(stockArticles: vm.stockArticles)
            
        }.task {
            await vm.fetchArticles()
        }
    }
}

#Preview {
    NewsArticleListScreen()
}

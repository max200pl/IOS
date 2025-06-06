//
//  NewsArticleListView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct NewsArticleListView: View {
    let stockArticles: [StockArticleViewModel]
    
    var body: some View {
        ForEach(stockArticles) { stockArticle in
            AricleGridView(articles: stockArticle.articles)
        }
    }
}

#Preview {
    NewsArticleListView(stockArticles: [])
}

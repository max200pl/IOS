//
//  NewsArticleListView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct NewsArticleListView: View {
    
    @EnvironmentObject private var routeState: RouteState
    
    let stockArticles: [StockArticleViewModel]

    var body: some View {
        ForEach(stockArticles) { stockArticle in
            ArticlesGridView(articles: stockArticle.articles){ article in
                guard let articlURL = article.url else { return }
                routeState.push(.businessArticles)
                routeState.route = .articleDetail(articlURL)
            }
        }
    }
}

#Preview {
    NewsArticleListView(stockArticles: [])
}

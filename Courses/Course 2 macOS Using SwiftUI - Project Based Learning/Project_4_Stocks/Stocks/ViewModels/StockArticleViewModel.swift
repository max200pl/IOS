//
//  StockArticleViewModel.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

struct StockArticleViewModel: Identifiable {
    let id = UUID()
    
    private let stockModel: Stock?
    private let articlesModel: [Article]
    
    init(stock: Stock? = nil, articles: [Article]) {
        self.stockModel = stock
        self.articlesModel = articles
    }
    
    var stock: StockViewModel? {
        guard let stockModel = stockModel else { return nil }
        return StockViewModel(stock: stockModel)
    }
    
    var articles: [ArticleViewModel] {
        articlesModel.map(ArticleViewModel.init)
    }
    
}

//
//  StockArticleListViewModel.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

@MainActor
class StockArticleListViewModel: ObservableObject {
    @Published var stockArticles: [StockArticleViewModel] = []
    
    func fetchArticles() async {
        do {
            let articles = try await Webservice().fetchBusinnessAricles()
            let stockArticleVM = StockArticleViewModel(articles: articles)
            self.stockArticles.append(stockArticleVM)
        } catch {
            print(error)
        }
    }
    
}

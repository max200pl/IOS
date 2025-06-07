//
//  StockDetailViewModel.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 07.06.2025.
//

import Foundation

@MainActor
class StockDetailViewModel: ObservableObject {
    @Published var articles: [ArticleViewModel] = []
    
    func fetchArticlesByStock(stock: StockViewModel) async {
        do {
            let articles = try await Webservice().fetchAriclesBy(stock: Stock.fromVM(stock))
            print(articles)
        } catch {
            print(error)
        }
    }
}

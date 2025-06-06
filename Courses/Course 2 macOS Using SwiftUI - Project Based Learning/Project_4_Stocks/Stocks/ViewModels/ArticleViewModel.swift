//
//  ArticleViewModel.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

struct ArticleViewModel: Identifiable {
    
     private let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var id: UUID = UUID()
    
    var title: String {
        article.title ?? ""
    }
    
    var source: String {
        article.sourceName ?? ""
    }
    
    var url: URL? {
        guard let url = article.url else { return nil }
        return URL(string: url)
    }
    
    var urlToImage: URL? {
        guard let urlToImage = article.urlToImage else { return nil }
        return URL(string: urlToImage)
    }
}

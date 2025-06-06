//
//  Article.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let url: String?
    let urlToImage: String?
    var sourceName: String?
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case url
        case urlToImage
        case source
    }
    
    private enum SourceKeys: String, CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        
        let articleContainer = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try? articleContainer.decode(String.self, forKey: .title)
        self.url = try? articleContainer.decode(String.self, forKey: .url)
        self.urlToImage = try? articleContainer.decode(String.self, forKey: .urlToImage)
        
        if let sourceContainer = try? articleContainer.nestedContainer(keyedBy: SourceKeys.self, forKey: .source) {
            self.sourceName = try? sourceContainer.decode(String.self, forKey: .name)
        }
    }
    
}


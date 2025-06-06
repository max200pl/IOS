//
//  Constants.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

struct Constants {
    struct Urls {
        static let allStocks = URL(string: "https://island-bramble.glitch.me/latest-stocks")!
        
        static let bussinesArticles = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2025-05-06&sortBy=publishedAt&apiKey=bfb66d76a2324b07ac132236123b7d78")!
    }
}

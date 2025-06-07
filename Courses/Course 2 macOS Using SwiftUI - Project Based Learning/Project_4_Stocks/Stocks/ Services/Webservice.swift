//
//  Webservice.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidServerResponse
}

class Webservice {
    func fetchStocks() async throws -> [Stock] {
        let (data,response) = try await URLSession.shared.data(from: Constants.Urls.allStocks)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let stocks = try JSONDecoder().decode([Stock].self , from: data)
        
        return stocks
    }
    
    func fetchAriclesBy(stock: Stock) async throws -> [Article] {
        let (data, response) = try await URLSession.shared.data(from: Constants.Urls.articlesBy(stock: stock))
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
        
        return articleResponse.articles
    }
    
    func fetchBusinnessAricles() async throws -> [Article] {
        let (data, response) = try await URLSession.shared.data(from: Constants.Urls.bussinesArticles)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print(response)
            throw NetworkError.invalidServerResponse
        }
        
        let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
        
        return articleResponse.articles
    }
}

//
//  WebService.swift
//  StocksMenuBar
//
//  Created by Maksym Poskannyi on 10.06.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    
}

class WebService {
    func getStocks(url: URL) async throws -> [Stock] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        
        return try decoder.decode([Stock].self, from: data)
    }
}

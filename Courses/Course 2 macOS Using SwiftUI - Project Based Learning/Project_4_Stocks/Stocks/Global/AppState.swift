//
//  AppState.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import Foundation

class AppState: ObservableObject {
    @Published var stocks: [StockViewModel] = []

}

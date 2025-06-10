//
//  Route.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 07.06.2025.
//

import Foundation

enum Route {
    case businessArticles
    case stockDetail(StockViewModel)
    case articleDetail(URL)
}

//
//  StocksApp.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/21/22.
//

import SwiftUI

@main
struct StocksApp: App {
    var body: some Scene {
        WindowGroup {
           HomeScreen()
                .frame(minWidth: 400, minHeight: 400)
                .environmentObject(AppState())
        }
    }
}

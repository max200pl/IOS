//
//  StocksApp.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/21/22.
//

import SwiftUI

@main
struct StocksApp: App {
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
           HomeScreen()
                .frame(minWidth: 400, minHeight: 400)
                .environmentObject(appState )
                .environmentObject(appState.routeState)
                .environmentObject(appState.stockState)
        }
    }
}

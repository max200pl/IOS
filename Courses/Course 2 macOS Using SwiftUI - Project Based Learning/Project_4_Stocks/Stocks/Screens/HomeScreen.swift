//
//  HomeScreen.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/21/22.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationView {
            SideBarScreen()
                .frame(minWidth: 300, maxWidth: 400)
            
            switch appState.route {
            case .businessAricles:
                NewsAricleListScreen()
            case .stockDetails(let stock):
                StockDetailScreen(stock: stock)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

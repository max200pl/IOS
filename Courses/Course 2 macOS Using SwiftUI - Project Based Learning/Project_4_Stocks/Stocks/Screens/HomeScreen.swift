//
//  HomeScreen.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/21/22.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var routeState: RouteState
    
    var body: some View {
        NavigationView {
            SideBarScreen()
                .frame(minWidth: 300, maxWidth: 400)
            
            switch routeState.route {
                case .businessArticles:
                    NewsArticleListScreen()
                case .stockDetail(let stock):
                    StockDetailScreen(stock: stock)
                case .articleDetail(let url):
                    WebViewScreen(url: url )
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

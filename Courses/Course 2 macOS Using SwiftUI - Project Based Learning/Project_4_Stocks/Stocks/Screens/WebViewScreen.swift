//
//  WebViewScreen.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 09.06.2025.
//

import SwiftUI

struct WebViewScreen: View {
    let url: URL
    
    @EnvironmentObject private var routeState: RouteState
    
    var body: some View {
        Text("WebViewScreen")
        
        VStack {
            WebView(url: url)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button("Back"){
                            if let route = routeState.pop() {
                                routeState.route = route
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    WebViewScreen(url: URL(string: "https://www.google.com")!)
}

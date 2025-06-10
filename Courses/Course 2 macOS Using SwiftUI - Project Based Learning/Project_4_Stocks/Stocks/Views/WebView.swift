//
//  WebView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 09.06.2025.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
    
    
}

#Preview {
    WebView(url: URL(string: "https://www.google.com")!)
}

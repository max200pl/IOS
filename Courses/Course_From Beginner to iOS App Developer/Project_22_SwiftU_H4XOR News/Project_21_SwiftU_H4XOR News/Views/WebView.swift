//
//  WebView.swift
//  Project_21_SwiftU_H4XOR News
//
//  Created by Maksym Poskannyi on 20.05.2025.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let urlString: String?
     
    func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString ?? "") {
            let request = URLRequest(url: url)
            
            uiView.load(request)
            
        }
    }
}


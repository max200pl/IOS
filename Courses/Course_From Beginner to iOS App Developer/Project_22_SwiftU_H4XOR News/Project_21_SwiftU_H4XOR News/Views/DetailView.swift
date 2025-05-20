//
//  DetailView.swift
//  Project_21_SwiftU_H4XOR News
//
//  Created by Maksym Poskannyi on 20.05.2025.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.haxornews.net/")
}

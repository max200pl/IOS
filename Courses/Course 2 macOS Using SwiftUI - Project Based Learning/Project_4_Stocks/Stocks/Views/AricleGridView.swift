//
//  AricleGridView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct AricleGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let articles: [ArticleViewModel]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(articles){ article in
                ArticleCellView(article: article)
            }
        }
    }
}
 

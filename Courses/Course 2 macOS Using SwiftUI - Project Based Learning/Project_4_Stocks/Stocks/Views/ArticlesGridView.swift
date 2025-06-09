//
//  ArticlesGridView.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/26/22.
//

import SwiftUI

struct ArticlesGridView: View {
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    let articles: [ArticleViewModel]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(articles) { article in
                ArticleCellView(article: article)
            }
        }
    }
}

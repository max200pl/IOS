//
//  ArticlesGridView.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/26/22.
//

import SwiftUI

struct ArticlesGridView: View {
    
    @EnvironmentObject private var appState: AppState
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    let articles: [ArticleViewModel]
    let onSelect: (ArticleViewModel) -> Void
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(articles) { article in
                ArticleCellView(article: article) { selectedAriticle in
                    onSelect(selectedAriticle)
                }
            }
        }
    }
}

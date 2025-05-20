//
//  ContentView.swift
//  Project_21_SwiftU_H4XOR News
//
//  Created by Maksym Poskannyi on 20.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts){ post in
                Text(post.title)
            }
            .navigationTitle(Text("H4XOR News"))
        }
    }
}

#Preview {
    ContentView()
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Post 1"),
    Post(id: "2", title: "Post 2"),
    
]

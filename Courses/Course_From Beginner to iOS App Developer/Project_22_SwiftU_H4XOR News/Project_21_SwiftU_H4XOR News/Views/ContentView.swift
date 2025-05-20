//
//  ContentView.swift
//  Project_21_SwiftU_H4XOR News
//
//  Created by Maksym Poskannyi on 20.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle(Text("H4XOR News"))
        }
        
        .onAppear{ // View did load
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}

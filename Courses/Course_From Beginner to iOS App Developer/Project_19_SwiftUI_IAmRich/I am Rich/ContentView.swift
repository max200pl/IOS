//
//  ContentView.swift
//  I am Rich
//
//  Created by Maksym Poskannyi on 19.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("I am Rich")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

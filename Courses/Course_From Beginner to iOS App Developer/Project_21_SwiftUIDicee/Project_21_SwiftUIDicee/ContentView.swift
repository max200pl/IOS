//
//  ContentView.swift
//  Project_21_SwiftUIDicee
//
//  Created by Maksym Poskannyi on 20.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var rightDiceeNumber: Int = 1
    @State var leftDiceeNumber: Int = 1
    
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
          
            VStack {
                Image("diceeLogo")
                    
                Spacer()
                
                HStack {
                    DiceeView(n: leftDiceeNumber)
                    DiceeView(n: rightDiceeNumber)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    self.leftDiceeNumber = Int.random(in: 1...6)
                    self.rightDiceeNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct DiceeView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

#Preview {
    ContentView()
}

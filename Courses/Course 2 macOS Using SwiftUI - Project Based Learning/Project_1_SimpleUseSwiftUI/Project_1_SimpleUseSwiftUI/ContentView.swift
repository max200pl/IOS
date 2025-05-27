//
//  ContentView.swift
//  Project_1_SimpleUseSwiftUI
//
//  Created by Maksym Poskannyi on 27.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack(alignment: .center) {
//            Rectangle()
//                .fill(Color.blue)
//                .frame(width: 200, height: 200)
//                .offset(x: 100)
//                .rotationEffect(.degrees(45))
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
//                .offset(x: -100)
//                .rotationEffect(.degrees(-45))
//        }.frame (
//            maxWidth: .infinity,
//            maxHeight: .infinity,
////            alignment: .center,
//        )
//        .padding()
        
        let cities: [String] = ["Denver", "Houston", "Seattle"]
        
        List(cities, id: \.self) { city in
            HStack {
                Image(city.lowercased())
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Text(city)
            }
        }
    }
}


struct MainViw: View {
    @State private var counter: Int = 0;
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Button("Incriment"){
                self.counter += 1
            }
            
            Text("\(counter)")
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
        MainViw()
    }
}

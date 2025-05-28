//
//  ContentView.swift
//  Project_1_SimpleUseSwiftUI
//
//  Created by Maksym Poskannyi on 27.05.2025.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var counter: Int = 99
}

struct AsidePanel: View {
    
    let cities: [String] = ["Denver", "Houston", "Seattle"]
    
    @EnvironmentObject var settings: Settings
    
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
//        }.frame (ß
//            maxWidth: .infinity,
//            maxHeight: .infinity,
////            alignment: .center,
//        )
//        .padding()
        
       return List(cities, id: \.self) { city in
            HStack {
                Image(city.lowercased())
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Text(city)
            }
           
           Text("Global \(settings.counter)")
        }
    }
}


struct MainView: View {
    @State private var counter: Int = 0;
    @State private var isOn: Bool = false
    @State private var selectedColor: Color = .blue
    
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        VStack {
            let _ = Self._printChanges()
            
            Image(systemName: isOn ? "sun.max": "moon")
                .font(.system(size: 32))
                .foregroundStyle(isOn ? .blue : .gray)
              
            Toggle("IsOn", isOn: $isOn)
            
            Button("Incriment"){
                self.counter += 1
                settings.counter += 1
            }
            
            Text("\(counter)")
            
            ColorSelectorView(selectedColor: $selectedColor)
            
            Spacer()
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 200, height: 200)
               
        }
    }
}

#Preview {
    let settings = Settings()
        NavigationView {
            AsidePanel()
            MainView()
        }
        .environmentObject(settings)
}

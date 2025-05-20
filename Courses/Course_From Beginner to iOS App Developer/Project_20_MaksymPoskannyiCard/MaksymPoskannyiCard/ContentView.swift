//
//  ContentView.swift
//  MaksymPoskannyiCard
//
//  Created by Maksym Poskannyi on 19.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Image("imgProfile").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                
                Text("Maksym Poskannyi")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("Full Stack Developer")
                    .font(.system(size: 25 , weight: .light))
                    .foregroundColor(.white)
                
                Divider()
            
                InfoUser(text: "+380508669945", imageName: "phone.fill")
                
                InfoUser(text: "max2000pl@gmail.com", imageName: "mail.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}

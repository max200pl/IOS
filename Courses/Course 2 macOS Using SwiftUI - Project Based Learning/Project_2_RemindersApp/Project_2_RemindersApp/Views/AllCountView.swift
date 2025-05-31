//
//  AllCountView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 31.05.2025.
//

import SwiftUI

struct AllCountView: View {
    let count: Int
    
    var body: some View {
        HStack{
            VStack {
                Image(systemName: Constants.Icons.trayCircleFill)
                    .font(.largeTitle)
                Text("All")
            }
            
            Spacer()
            
            VStack {
                Text("\(count)")
                    .font(.title)
                EmptyView()
            }
        }
        .padding()
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
    }
}

#Preview {
    AllCountView(count: 10)
}

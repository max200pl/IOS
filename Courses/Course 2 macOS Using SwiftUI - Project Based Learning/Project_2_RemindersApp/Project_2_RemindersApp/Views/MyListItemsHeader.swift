//
//  MyListItemsHeader.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import SwiftUI

struct MyListItemsHeader: View {
    let name: String
    let count: Int
    let color: Color
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .foregroundColor(color)
                .padding()
            Spacer()
            Text("\(count)")
                .font(.system(size: 32))
                .foregroundColor(color)
                .padding()
        }
        
    }
}

#Preview {
    MyListItemsHeader(name: "Groceties", count: 6, color: Color.green)
}

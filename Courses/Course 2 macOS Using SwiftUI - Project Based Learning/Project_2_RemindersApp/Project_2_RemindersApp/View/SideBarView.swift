//
//  SideBarView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack {
            Text("Al ites Count 10")
            
            List (1...5, id: \.self) { index in
                Text("Item \(index)")
            }
            Spacer()
            Button("Add List"){
                 
            }
        }
    }
}

#Preview {
    SideBarView()
}

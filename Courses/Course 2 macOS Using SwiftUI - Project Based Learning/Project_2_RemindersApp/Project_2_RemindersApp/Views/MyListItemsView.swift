//
//  MyListItemsView.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import SwiftUI

struct MyListItemsView: View {
    var items: [MyListItemViewModel]
    
    typealias ItemAdded = ((String, Date?) -> Void)?
    
    var onItemAdded: ItemAdded
    
    init(items: [MyListItemViewModel], onItemAdded: ItemAdded = nil) {
        self.items = items
        self.onItemAdded = onItemAdded
    }
    
    var body: some View {
        VStack(alignment: .leading) { 
            List {
                ForEach(items, id:  \.listItemId) { item in
                    Text(item.title)
                    Divider()
                }
                
                AddNewListItemView { title, DueDate in
                    onItemAdded?(title, DueDate)
                    
                }
            }
        }
    }
}

#Preview {
    MyListItemsView(items: [])
}

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
    typealias ItemDeleted = ((MyListItemViewModel) -> Void)?
    typealias ItemComleted = ((MyListItemViewModel) -> Void)?
    
    var onItemAdded: ItemAdded
    var onItemDeleted: ItemDeleted
    var onItemCompleted: ItemComleted
    
    init
    (
        items: [MyListItemViewModel],
        onItemAdded: ItemAdded = nil,
        onItemDeleted: ItemDeleted = nil,
        onItemCompleted: ItemComleted = nil
    ) {
        self.onItemCompleted = onItemCompleted
        self.onItemAdded = onItemAdded
        self.items = items
        self.onItemDeleted = onItemDeleted
    }
    
    var body: some View {
        VStack(alignment: .leading) { 
            List {
                ForEach(items, id:  \.listItemId) { item in
                    ListItemCell(
                        item: item,
                        onListItemDeleted: { item in onItemDeleted?(item)},
                        onListItemCompleted: { item in onItemCompleted?(item)}
                    )
                    
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

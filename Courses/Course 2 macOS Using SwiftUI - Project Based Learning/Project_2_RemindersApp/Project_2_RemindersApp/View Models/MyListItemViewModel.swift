//
//  MyListItemViewModel.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 30.05.2025.
//

import Foundation
import CoreData

struct MyListItemViewModel {
    private let myListItem: MyListItem
    let id = UUID()
    
    init(myListItem: MyListItem) {
        self.myListItem = myListItem
    }
    
    var listItemId: NSManagedObjectID {
        myListItem.objectID
    }
    
    var title: String {
        myListItem.title ?? "No title"
    }
    
    var dyeDate: DueDate? {
        if let date = myListItem.dueDate {
            return DueDate.from(value: date)
        } else {
            return nil
        }
    }
    
    var isCompleted: Bool {
        myListItem.isCompleted
    }
}

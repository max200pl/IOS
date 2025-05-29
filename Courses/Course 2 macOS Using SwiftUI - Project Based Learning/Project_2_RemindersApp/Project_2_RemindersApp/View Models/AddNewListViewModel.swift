//
//  AddNewListViewModel.swift
//  Reminders
//
//  Created by Mohammad Azam on 12/2/21.
//

import Foundation
import CoreData
import SwiftUI

// view model нужна для общения с моделью и получения данных

class AddNewListViewModel: ObservableObject { // для обновления UI ObservableObject
    
    @Published var name: String = ""
    @Published var color: Color = .blue
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let myList = MyList(context: context)
            myList.name = name
            myList.color = NSColor(color)
            try myList.save()
        } catch {
            print(error)
        }
    }
    
}

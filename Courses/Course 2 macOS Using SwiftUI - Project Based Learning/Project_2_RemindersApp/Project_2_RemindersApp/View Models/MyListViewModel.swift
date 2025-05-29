//
//  MyListViewModel.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import Foundation
import CoreData
import SwiftUI 

struct MyListViewModel: Identifiable {
    private let myList: MyList
    
    init(myList: MyList) {
        self.myList = myList
    }
    
    // что мы отдаем на внешний мир
    // ----------------------------
    var id: NSManagedObjectID { //CoreData Id
        myList.objectID
    }
    
    var name: String {
        myList.name ?? ""
    }
    
    var color: Color { // SwiftUI -> Color
        Color(myList.color ?? .clear)
    }
    // ----------------------------
}

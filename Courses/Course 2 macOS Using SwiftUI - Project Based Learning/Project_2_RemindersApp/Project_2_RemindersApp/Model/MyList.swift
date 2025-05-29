//
//  MyList.swift
//  Reminders
//
//  Created by Mohammad Azam on 12/2/21.
//

import Foundation
import CoreData
import AppKit

@objc(MyList)
class MyList: NSManagedObject, BaseModel {
    // Свойство класса которое возвращает Весь список с Core data
    static var all: NSFetchRequest<MyList> {
        // запрос на получения данных
        let request: NSFetchRequest<MyList> = MyList.fetchRequest()
        
        // без сортировки
        request.sortDescriptors = []
          
        return request
    }
}

extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?

}

extension MyList : Identifiable {

}

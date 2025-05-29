//
//  BaseModel.swift
//  Reminders
//
//  Created by Mohammad Azam on 12/2/21.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
}

// дает реализацию по умолчанию если если класс — это Core Data модель (NSManagedObject).
extension BaseModel where Self: NSManagedObject {
    
    //метод по умолчанию
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
}

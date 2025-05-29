//
//  CoreDataManager.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import Foundation
import CoreData

class CoreDataManager { // Синглтон
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    private init() { // защита от повторного выполнения
        // Register NSColorTransformer
        ValueTransformer.setValueTransformer(NSColorTransformer(), forName: NSValueTransformerName("NSColorTransformer"))

        
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

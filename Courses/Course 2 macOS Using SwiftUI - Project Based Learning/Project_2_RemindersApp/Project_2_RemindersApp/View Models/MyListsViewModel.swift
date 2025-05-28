//
//  MyListsViewModel.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import Foundation
import SwiftUI
import CoreData

class MyListsViewModel: NSObject, ObservableObject {
    @Published var myLists = [MyListViewModel]()
    
    //1. Get List
    private let fetchResultsController: NSFetchedResultsController<MyList>
    
    //2. Get context
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchResultsController = NSFetchedResultsController(fetchRequest: MyList.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        fetchResultsController.delegate = self
         
        fetchAll()
    }
    
    private func fetchAll() {
        do {
            try fetchResultsController.performFetch()
            
            guard let myLists = fetchResultsController.fetchedObjects else {
                return
            }
            self.myLists =  myLists.map(MyListViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
}

extension MyListsViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else {
            return
        }
        
        self.myLists = myLists.map(MyListViewModel.init)
    }
}

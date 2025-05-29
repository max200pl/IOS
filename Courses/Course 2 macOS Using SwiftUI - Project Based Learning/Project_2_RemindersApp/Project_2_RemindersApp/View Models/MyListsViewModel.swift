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
    @Published var myLists = [MyListViewModel]() //обновляем UI
    
    //1. Get List
    private let fetchResultsController: NSFetchedResultsController<MyList>
    
    //2. Get context with data from DB
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        
        //Get data from Core Data Создаётся контроллер выборки NSFetchedResultsController
        fetchResultsController = NSFetchedResultsController(
            fetchRequest: MyList.all,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        // super.init() — это вызов конструктора родителя NSObject должен быть инициализирован что бы инициализировать наследуемое поведение и внутренности.
        super.init()
        
        // Если в Core Data что-то изменится — вызови мой метод controllerDidChangeContent()»
        // Один объект «слушает» другой    fetchResultsController.delegate = self
        fetchResultsController.delegate = self // подключаем делегат

         
        fetchAll() // первая загрузка данных
    }
    
    private func fetchAll() {
        do {
            //1. fetch запрос на получения данных
            try fetchResultsController.performFetch()
            
            //2. fetched get myLists Core data model Objects
            guard let myLists = fetchResultsController.fetchedObjects else {
                return
            }
            
            //3. normalize data from Core data model Objects
            self.myLists = myLists.map(MyListViewModel.init)
            
        } catch {
            print(error)
        }
    }
}

//MARK: - NSFetchedResultsControllerDelegate

extension MyListsViewModel: NSFetchedResultsControllerDelegate {// авто отслеживание если данные изменились
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //2. fetched get myLists Core data model Objects
        guard let myLists = controller.fetchedObjects as? [MyList] else {
            return
        }
        
        //3. normalize data from Core data model Objects
        self.myLists = myLists.map(MyListViewModel.init)
    }
}

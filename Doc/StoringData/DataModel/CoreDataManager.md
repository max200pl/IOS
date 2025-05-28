# Core Data Manager

```swift
import CoreData
import Foundation

class CoreDataManager {
    let persistentContainer: NSPersistentContainer // The container that holds the Core Data stack
    static let shared = CoreDataManager() // Singleton instance for easy access

    private init() {
        //1. Initialize the persistent container with the name of your .xcdatamodeld file
        persistentContainer = NSPersistentContainer(name: "Model") // Replace "Model" with your .xcdatamodeld name

        //2. Load the persistent stores
        // This method loads the persistent stores and handles any errors that may occur
        // It is called during the initialization of the Core Data stack
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

// Injecting the managed object context into the environment


@main
struct MyApp: App {


    var body: some Scene {
        WindowGroup {
            // Access the managed object context from the Core Data manager
            let context = CoreDataManager.shared.persistentContainer.viewContext
            // Inject the context into the environment
            ContentView().environment(\.managedObjectContext, context)
        }
    }
}


```

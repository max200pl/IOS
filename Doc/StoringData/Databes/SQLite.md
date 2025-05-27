# SQLite in swift

## Read data from SQLite

```swift

class Item: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var price: Double
}


func loadData() {
 let request = NSFetchRequest<Item> = Item.fetchRequest()

 do {
     let items = try context.fetch(request)
     for item in items {
         print("Item name: \(item.name ?? ""), price: \(item.price)")
     }
 } catch {
     print("Failed to fetch items: \(error)")
 }
}
```

## Delete data from SQLite

```swift
func deleteData() {
    let request = NSFetchRequest<Item> = Item.fetchRequest()

    do {
        let items = try context.fetch(request)
        for item in items {
            context.delete(item)
        }
        try context.save()
    } catch {
        print("Failed to delete items: \(error)")
    }
}
```

## Query data from SQLite

```swift
func queryData() {
    let request = NSFetchRequest<Item> = Item.fetchRequest()
    request.predicate = NSPredicate(format: "price > %d", 10)

    do {
        let items = try context.fetch(request)
        for item in items {
            print("Item name: \(item.name ?? ""), price: \(item.price)")
        }
    } catch {
        print("Failed to fetch items: \(error)")
    }
}
```

## Sort query data from SQLite

```swift

func sortQueryData() {
    let request = NSFetchRequest<Item> = Item.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "price", ascending: true)]

    do {
        let items = try context.fetch(request)
        for item in items {
            print("Item name: \(item.name ?? ""), price: \(item.price)")
        }
    } catch {
        print("Failed to fetch items: \(error)")
    }
}
```
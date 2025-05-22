# SQLite in swift

## Read data from SQLite

```swift

class Item: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var price: Double
}


func loadData() {
 let request = NSFetchRequest<Item> = Item.fetchRequest()
}
```

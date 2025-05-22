# SearchBar in SwiftUI

[Udemy link](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/10929490#overview)

## How to use SearchBar in SwiftUI
```swift
import SwiftUI
import UIKit

extension TodolistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()

        //SEARCH DATA
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)

        request.predicate = predicate

        // SORTING
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)

        request.sortDescriptors = [sortDescriptor]

        LoadItems(with: request)
    }
}
```
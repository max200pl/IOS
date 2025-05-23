# Realm in iOS

## Overview

Realm is a modern, object-oriented database that provides an alternative to Core Data and SQLite for data storage in iOS applications. It is designed to be easy to use and offers high performance for data operations.
- Realm allows you to define your data models as Swift classes, making it easy to work with your data in a natural way.
- It provides a simple API for querying and manipulating data, making it suitable for both small and large datasets.
- Realm is cross-platform, allowing you to share data models between iOS, Android, and other platforms.
- It supports real-time data synchronization, making it suitable for applications that require live updates across devices.
- Realm is open-source and has a large community, making it easy to find resources and support.

## dynamic keyword

### Overview

- The `dynamic` keyword in Swift is used to indicate that a property or method can be overridden at runtime. This is particularly useful when working with Objective-C code or frameworks that rely on dynamic dispatch.
- In the context of Realm, the `dynamic` keyword is used to mark properties in your Realm model classes. This allows Realm to automatically observe changes to those properties and update the database accordingly.


### Example

```swift
import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false

    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>() //! Realm List
}


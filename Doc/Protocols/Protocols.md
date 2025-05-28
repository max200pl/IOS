# Protocols in Swift

    Protocols are a powerful feature in Swift that allow you to define a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. They can be adopted by classes, structures, and enumerations to provide a common interface.

## Defining a Protocol

```swift
protocol SomeProtocol {
    var property: String { get }
    func someMethod()
}
```

## Adopting a Protocol

- When a type adopts a protocol, it must implement all the requirements defined in that protocol.

```swift
struct SomeStruct: SomeProtocol {
    var property: String {
        return "Hello, Protocol!"
    }

    func someMethod() {
        print("Method from protocol")
    }
}
```

## Protocol Inheritance

Protocols can inherit from other protocols, allowing you to create a hierarchy of protocols.

```swift
    protocol AnotherProtocol: SomeProtocol {
        func anotherMethod()
    }
    struct AnotherStruct: AnotherProtocol {
        var property: String {
            return "Hello, Inheritance!"
        }

        func someMethod() {
            print("Method from inherited protocol")
        }

        func anotherMethod() {
            print("Another method from protocol")
        }
    }
```

## Protocol Composition

You can combine multiple protocols into a single requirement using protocol composition.

```swift
    protocol FirstProtocol {
        func firstMethod()
    }
    protocol SecondProtocol {
        func secondMethod()
    }

    struct CombinedStruct: FirstProtocol, SecondProtocol {
        func firstMethod() {
            print("First method")
        }

        func secondMethod() {
            print("Second method")
        }
    }
```

## Protocol Extensions

You can extend a protocol to provide default implementations of methods or properties.

    ```swift
    extension SomeProtocol {
        func defaultMethod() {
            print("Default method from protocol extension")
        }
    }
    ```

## Using Protocols as Types

Protocols can be used as types, allowing you to create variables or parameters that can hold any type that conforms to the protocol.

```swift
    func performAction(with object: SomeProtocol) {
        object.someMethod()
    }
```
## Example Usage

- `where Self: NSManagedObject` ensures that this extension is only applied to types that are subclasses of NSManagedObject, which is the base class for Core Data entities.
- `throws` allows the `save()` method to throw an error if the save operation fails, enabling error handling when saving the model to Core Data.

```swift

import CoreData
import Foundation

//1. Define a protocol for a model that can be saved to Core Data

protocol BaseModel{
    // A static property to access the view context of Core Data
    static var viewContext: NSManagedObjectContext { get }
    // A method to save the model to Core Data
    func save() throws
}

// 2. Extend the BaseModel protocol to provide default implementations
extension BaseModel where Self: NSManagedObject {
    // Provide a default implementation for the viewContext property
    static var viewContext: NSManagedObjectContext {
        // Assuming CoreDataManager is a singleton that manages the Core Data stack
        CoreDataManager.shared.persistentContainer.viewContext
    }

    // Provide a default implementation for the save method
    func save() throws {
        try Self.viewContext.save()
    }
}
```

## Best Practices

- Use protocols to define a common interface for related types.
- Prefer protocol-oriented programming over inheritance when possible.
- Use protocol extensions to provide default implementations and reduce code duplication.
- Use associated types to create flexible and reusable protocols.

## Additional Resources

- [Apple's Swift Programming Language Guide](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [Swift.org Protocols Documentation](https://swift.org/documentation/)

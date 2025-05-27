# Any, AnyObject, NSObject in Swift

[Udemy link](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813332#overview)

![Any_AnyObject_NSObject](Any_AnyObject_NSObject.png)

## What is Any?
- `Any` is a type in Swift that can represent an instance of any type, including function types.
- It is a supertype of all types in Swift, meaning that any value can be assigned to a variable of type `Any`.
- You can use `Any` when you don't know the specific type of a value at compile time.
- However, using `Any` can lead to less type safety and should be used judiciously.

### Example of Any
```swift
let myValue: Any = "Hello, World!"
let myInt: Any = 42
let myDouble: Any = 3.14
let myArray: Any = [1, 2, 3, 4, 5]
let myDictionary: Any = ["key": "value"]
```

## What is AnyObject?
- `AnyObject` is a protocol in Swift that represents an instance of any class type.
- It is a supertype of all class types in Swift, meaning that any class instance can be assigned to a variable of type `AnyObject`.
- `AnyObject` is often used in Objective-C interoperability, where it can represent any object type.
- In Swift, you can use `AnyObject` to work with class instances without knowing their specific types.

### What problem does AnyObject solve?

- `AnyObject` allows you to work with class instances in a more flexible way, especially when dealing with collections or APIs that require a generic object type.
- It is useful when you need to store or pass around objects of different class types without knowing their specific types at compile time.

### Example of AnyObject

```swift
class Animal {
    func makeSound() {
        print("Animal sound")
    }
}
class Dog: Animal {
    override func makeSound() {
        print("Bark")
    }
}
class Cat: Animal {
    override func makeSound() {
        print("Meow")
    }
}
let myDog: AnyObject = Dog()
let myCat: AnyObject = Cat()
let myAnimal: AnyObject = myDog
```

## What is NSObject?

- `NSObject` is the root class of most Objective-C class hierarchies.
- It provides basic object behavior and is the base class for many Cocoa and Cocoa Touch classes.
- In Swift, you can subclass `NSObject` to create custom classes that inherit from it.
- `NSObject` provides methods for memory management, introspection, and other common object behaviors.
- It is often used in Objective-C interoperability, where you need to work with Objective-C classes and APIs.
- `NSObject` is not a protocol, but a concrete class that can be subclassed.

### What problem does NSObject solve?

- `NSObject` provides a common interface for all Objective-C objects, allowing you to work with them in a consistent way.
- It provides basic functionality for memory management, method invocation, and property access.
- It is useful when you need to work with Objective-C APIs or when you want to take advantage of the features provided by the `NSObject` class.

### Example of NSObject

```swift
import Foundation
class MyClass: NSObject {
    var name: String
    init(name: String) {
        self.name = name
    }
}
let myObject = MyClass(name: "My Object")
print(myObject.name) // Output: My Object
```
- In this example, `MyClass` is a subclass of `NSObject`, and it inherits the behavior and properties of `NSObject`.
- You can create instances of `MyClass` and access its properties and methods just like any other class in Swift.
- `NSObject` is useful when you need to work with Objective-C APIs or when you want to take advantage of the features provided by the `NSObject` class.

## When to use Any, AnyObject, and NSObject?
- Use `Any` when you need to represent a value of any type, including function types.
- Use `AnyObject` when you need to represent an instance of any class type, especially when working with Objective-C APIs or collections that require a generic object type.
- Use `NSObject` when you need to create a custom class that inherits from the root class of Objective-C, or when you need to work with Objective-C APIs that require `NSObject` as a base class.
- Use `NSObject` when you need to take advantage of the features provided by the `NSObject` class, such as memory management and introspection.
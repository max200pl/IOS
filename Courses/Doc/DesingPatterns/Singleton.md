# Singleton

## What is Singleton?

- The Singleton pattern is a design pattern that restricts the instantiation of a class to a single instance.
- This is useful when exactly one object is needed to coordinate actions across the system.
- The Singleton pattern is often used for shared resources, such as configuration settings, logging, or database connections.
- In Swift, you can implement the Singleton pattern using a static property or a shared instance.

## Example of Singleton

```swift
class Singleton {
    static let shared = Singleton()

    private init() {
        // Private initializer to prevent instantiation from outside
    }

    func doSomething() {
        print("Doing something...")
    }
}
let singletonInstance = Singleton.shared
singletonInstance.doSomething() // Output: Doing something...

let anotherInstance = Singleton.shared
print(singletonInstance === anotherInstance) // Output: true
```
- In this example, the `Singleton` class has a static property `shared` that holds the single instance of the class.
- The initializer is marked as `private` to prevent instantiation from outside the class.
- The `doSomething` method can be called on the singleton instance to perform actions.

## Example 2 of Singleton

```swift

class Car {
    var color = "Red"

    static let shared = Car()
    private init() {
        // Private initializer to prevent instantiation from outside
    }
}

let car1 = Car.shared
car1.color = "Blue"
let car2 = Car.shared
print(car1.color) // Output: Blue

class A {
    init(){
        Car.shared.color = "Red"
    }
}

class B {
    init(){
        print(Car.shared.color) // Output: Red
    }
}

let a = A()
let b = B()
```
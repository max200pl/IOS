# Casting in Swift

Casting is a powerful feature in Swift that allows you to convert an object from one type to another. This is particularly useful when working with class hierarchies or protocols. In this document, we will cover the basics of casting in Swift, including type casting operators, optional binding, and examples.

## Links

[UDEMY Link](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813332#overview)

[DOC Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/)

## Type Casting Operators

- Swift provides two type casting operators: `as` and `as?`.
- The `as` operator is used for forced casting, while the `as?` operator is used for optional casting.
- The `as!` operator is used for forced downcasting, which can crash the program if the cast fails.
- The `as?` operator returns an optional value, which is `nil` if the cast fails.

## Example of Type Casting

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
let myDog: Animal = Dog()
let myCat: Animal = Cat()
let myAnimal: Animal = myDog
if let dog = myAnimal as? Dog {
    dog.makeSound() // Output: Bark
} else {
    print("Not a Dog")
}
```

## Optional Binding

- Optional binding is a way to safely unwrap optionals in Swift.
- You can use `if let` or `guard let` to check if an optional has a value and safely unwrap it.

```swift
let optionalDog: Dog? = Dog()
if let dog = optionalDog {
    dog.makeSound() // Output: Bark
} else {
    print("No Dog")
}
```

## Example of Forced Downcasting

```swift
let myAnimal: Animal = Dog()
let myDog = myAnimal as! Dog
myDog.makeSound() // Output: Bark
```

## Example of Optional Downcasting

```swift
let myAnimal: Animal = Dog()
if let myDog = myAnimal as? Dog {
    myDog.makeSound() // Output: Bark
} else {
    print("Not a Dog")
}
```

## Example of Forced Downcasting with Error Handling

```swift
let myAnimal: Animal = Cat()
do {
    let myDog = myAnimal as! Dog
    myDog.makeSound() // This will crash if myAnimal is not a Dog
} catch {
    print("Error: \(error)")
}
```

## Example of Optional Downcasting with Error Handling

```swift
let myAnimal: Animal = Cat()
if let myDog = myAnimal as? Dog {
    myDog.makeSound() // This will not crash, but will not execute if myAnimal is not a Dog
} else {
    print("Not a Dog")
}
```

## Example of Type Checking

```swift
let myAnimal: Animal = Dog()
if myAnimal is Dog {
    print("myAnimal is a Dog")
} else {
    print("myAnimal is not a Dog")
}
```

# Classes Vs Struct in Swift

## Classes

Classes are reference types, meaning that when you assign or pass a class instance, you are passing a reference to the same instance. This means that changes made to one reference will affect all references to that instance.

## Structs

Structs are value types, meaning that when you assign or pass a struct instance, you are passing a copy of the instance. This means that changes made to one copy will not affect other copies.
Structs are generally used for lightweight data structures that do not require inheritance or reference semantics.
Structs are copied when they are assigned or passed to a function, while classes are referenced. This means that if you modify a struct, the original instance remains unchanged, while modifying a class instance will affect all references to that instance.

## Key Differences

| Feature                | Classes                      | Structs                     |
|------------------------|------------------------------|-----------------------------|
| Inheritance            | Yes                          | No                          |
| Reference Type         | Yes                          | No                          |
| Value Type             | No                           | Yes                         |
| Mutability             | Mutable                      | Immutable                   |
| Identity               | Yes (using `===`)           | No                          |
| Memory Management      | Automatic Reference Counting | Stack Allocation            |
| Performance            | Slower (due to reference counting) | Faster (stack allocation) |

## When to Use

- Use classes when you need reference semantics, inheritance, or identity.
- Use structs when you need value semantics, lightweight data structures, or when you want to ensure that data is copied rather than referenced.
## Example

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}
struct Point {
    var x: Int
    var y: Int
}
var point1 = Point(x: 0, y: 0)
var point2 = point1 // Copy of point1
point2.x = 10 // point1 remains unchanged
print(point1.x) // 0
print(point2.x) // 10
var person1 = Person(name: "John")
var person2 = person1 // Reference to the same instance
person2.name = "Jane" // person1 is also changed
print(person1.name) // Jane
print(person2.name) // Jane
```


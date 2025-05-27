# Tuples in Swift

Tuples in Swift allow you to group multiple values into a single compound value. They are useful for returning multiple values from functions, storing related data, or as a lightweight alternative to structs for simple data structures.

## Creating Tuples

Tuples are created by enclosing a comma-separated list of values in parentheses. Each value can have a different type.

```swift
let person = (name: "Alice", age: 30, isEmployed: true)
```

## Accessing Tuple Elements

Access tuple elements using named properties or their index.

```swift
let name = person.name // By name
let age = person.1     // By index
```

## Destructuring Tuples

Destructure a tuple into individual variables using pattern matching.

```swift
let (name, age, isEmployed) = person
print("Name: \(name), Age: \(age), Employed: \(isEmployed)")
```

## Nested Tuples

Tuples can be nested to create complex data structures.

```swift
let employee = (name: "Bob", details: (age: 28, isEmployed: true))
print("Name: \(employee.name), Age: \(employee.details.age), Employed: \(employee.details.isEmployed)")
```

## Tuples as Function Return Types

Functions can return tuples to provide multiple values.

```swift
func getUserInfo() -> (name: String, age: Int) {
    return (name: "Charlie", age: 25)
}

let userInfo = getUserInfo()
print("Name: \(userInfo.name), Age: \(userInfo.age)")
```

## Tuples and Pattern Matching

Use tuples in `switch` statements or `if-let` bindings for pattern matching.

```swift
let coordinates = (x: 10, y: 20)

switch coordinates {
case (let x, let y):
    print("Coordinates: (\(x), \(y))")
case (0, 0):
    print("Origin")
default:
    print("Other coordinates")
}
```

## Limitations of Tuples

While versatile, tuples have limitations:

- Lack of self-documenting properties compared to structs or classes.
- Unsuitable for complex data structures or defining methods.
- No support for inheritance or protocols.

## Conclusion

Tuples in Swift are a convenient way to group related values, especially for lightweight data structures or returning multiple values from functions. For more complex data models, consider using structs or classes for better clarity and functionality.

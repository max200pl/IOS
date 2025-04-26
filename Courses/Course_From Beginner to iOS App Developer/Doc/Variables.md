# Variables in Swift

## Variables
Variables are used to store data in Swift. You can declare a variable using the `var` keyword, followed by the variable name and its type. For example:

```swift
var name: String = "John Doe"
var age: Int = 30
```
You can also declare a variable without specifying its type, and Swift will infer the type based on the value you assign to it:

```swift
var name = "John Doe" // Swift infers that name is of type String
var age = 30 // Swift infers that age is of type Int
```
## Constants

Constants are similar to variables, but their values cannot be changed after they are set. You can declare a constant using the `let` keyword:

```swift
let pi: Double = 3.14159
let maxScore = 100 // Swift infers that maxScore is of type Int
```

## Data Types

Swift has several built-in data types, including:
- `Int`: Represents integer values.
- `Double`: Represents floating-point values.
- `String`: Represents text values.
- `Bool`: Represents boolean values (true or false).
- `Array`: Represents a collection of values of the same type.
- `Dictionary`: Represents a collection of key-value pairs.
- `Set`: Represents a collection of unique values.
- `Optional`: Represents a value that may or may not be present.


```swift
Int.random(in: 1...10) // Generates a random integer between 1 and 10
```


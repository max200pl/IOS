# Function in Swift

## What is a Function?

A function is a reusable block of code that performs a specific task. Functions can take input parameters, perform operations, and return a value. Functions help organize code, improve readability, and promote code reuse.

## Function Declaration

A function is declared using the `func` keyword, followed by the function name, parameter list, and return type. Here's an example of a simple function that adds two numbers:

```swift

func addNumbers(a: Int, b: Int) -> Int {
    return a + b
}
```

## Function Parameters

Functions can take parameters, which are values passed to the function when it is called. Parameters are defined in the function declaration and can have default values. Here's an example of a function with parameters:

```swift
func greet(name: String, greeting: String = "Hello") {
    print("\(greeting), \(name)!")
}
```

## Function Return Values

Functions can return a value using the `->` syntax in the function declaration. The return type is specified after the parameter list. Here's an example of a function that returns a value:

```swift
func multiply(a: Int, b: Int) -> Int {
    return a * b
}
```

## Function Overloading

Function overloading allows you to define multiple functions with the same name but different parameter types or counts. Swift will determine which function to call based on the arguments provided. Here's an example of function overloading:

```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}

func add(a: Double, b: Double) -> Double {
    return a + b
}
```

## Function Types

Functions in Swift have types, which are defined by their parameter types and return type. You can assign a function to a variable or pass it as an argument to another function. Here's an example of a function type:

```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}
let addFunction: (Int, Int) -> Int = add
let result = addFunction(3, 5) // result is 8
```

## Closures

A closure is a self-contained block of code that can be passed around and used in your code. Closures can capture and store references to variables and constants from the surrounding context. Here's an example of a closure:

```swift
let addClosure: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}
let result = addClosure(3, 5) // result is 8
```

## Trailing Closure Syntax

When a closure is the last argument of a function, you can use trailing closure syntax to write the closure outside the function call. Here's an example:

```swift

func performOperation(operation: (Int, Int) -> Int, a: Int, b: Int) {
    let result = operation(a, b)
    print("Result: \(result)")
}

performOperation(operation: { (a, b) in
    return a + b
}, a: 3, b: 5)
```

## Conclusion

Functions are a fundamental concept in Swift programming. They allow you to organize your code, improve readability, and promote code reuse. Understanding how to declare, use, and manipulate functions is essential for writing efficient and maintainable Swift code.


# Loops in Swift

Loops are a fundamental concept in programming that allow you to execute a block of code multiple times. In Swift, there are several types of loops, including `for`, `while`, and `repeat-while` loops. This document will cover the basics of each type of loop and provide examples of how to use them.

## For Loop

The `for` loop is used to iterate over a sequence, such as an array or a range of numbers. The syntax for a `for` loop in Swift is as follows:

```swift
for index in 1..<5 {
    print("Index: \(index)")
}

for _ in 1...5 {
    print("Hello, World!")
}

let contacts  = ["John": "1234567890", "Jane": "0987654321"]
for (name, number) in contacts {
    print("Name: \(name), Number: \(number)")
}

for person in contacts {
    print("Name: \(person.key), Number: \(person.value)")
}
```

In this example, the loop iterates over the range from 1 to 5, and the value of `index` is printed in each iteration.

You can also use a `for` loop to iterate over an array:

```swift
let fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits {
    print("Fruit: \(fruit)")
}
```

In this example, the loop iterates over the `fruits` array, and the value of `fruit` is printed in each iteration.

## While Loop

The `while` loop is used to execute a block of code as long as a specified condition is true. The syntax for a `while` loop in Swift is as follows:

```swift
var count = 1
while count <= 5 {
    print("Count: \(count)")
    count += 1
}
```

In this example, the loop continues to execute as long as `count` is less than or equal to 5. The value of `count` is printed in each iteration, and it is incremented by 1.

## Repeat-While Loop

The `repeat-while` loop is similar to the `while` loop, but it guarantees that the block of code will be executed at least once before checking the condition. The syntax for a `repeat-while` loop in Swift is as follows:

```swift
var count = 1
repeat {
    print("Count: \(count)")
    count += 1
} while count <= 5
```

In this example, the loop executes the block of code first and then checks the condition. The value of `count` is printed in each iteration, and it is incremented by 1.

## Break and Continue Statements

You can use the `break` statement to exit a loop prematurely, and the `continue` statement to skip the current iteration and move to the next one. Here are examples of both:

### Break Statement

```swift
for index in 1...10 {
    if index == 5 {
        break
    }
    print("Index: \(index)")
}
```

In this example, the loop will exit when `index` is equal to 5, and the numbers 1 to 4 will be printed.

### Continue Statement

```swift
for index in 1...10 {
    if index == 5 {
        continue
    }
    print("Index: \(index)")
}
```

In this example, the loop will skip the iteration when `index` is equal to 5, and the numbers 1 to 10 will be printed except for 5.

## Conclusion

Loops are a powerful feature in Swift that allow you to execute code multiple times based on certain conditions. Understanding how to use `for`, `while`, and `repeat-while` loops, as well as the `break` and `continue` statements, will help you write more efficient and effective code in your Swift applications.

## Additional Resources

- [Swift Documentation - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Swift Language Guide - Loops](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID634)
- [Swift Programming Language - Loops](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID634)
- [Swift.org - Swift Language](https://swift.org/documentation/)
- [Apple Developer Documentation - Swift](https://developer.apple.com/documentation/swift)
- [Ray Wenderlich - Swift Tutorials](https://www.raywenderlich.com/ios/paths/learn-swift)
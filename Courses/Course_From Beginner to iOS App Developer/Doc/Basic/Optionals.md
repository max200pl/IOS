# Options in Swift

## What are Optionals?

An optional is a type in Swift that can hold either a value or `nil`, indicating the absence of a value. Optionals are used to handle situations where a value may be missing or not applicable. This is particularly useful when dealing with variables that may not have a value at all, such as when retrieving data from a database or network request.

## Declaring Optionals
You declare an optional by appending a question mark (`?`) to the type of the variable. For example:

```swift
var name: String? // This variable can hold a String or nil
```
You can also declare optionals with an exclamation mark (`!`) to indicate that the variable is implicitly unwrapped. This means that you are certain that the variable will have a value when you use it, and you don't need to check for nil:

```swift
var name: String! // This variable can hold a String or nil, but will be unwrapped automatically when used
```
## Using Optionals
You can assign a value to an optional variable like this:

```swift
var name: String? = "Alice"
```
You can also assign `nil` to an optional variable:

```swift
name = nil
```
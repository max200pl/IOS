# Networking Errors in Swift

## Error Handling in Swift
- Swift provides a robust error handling model that allows developers to catch and handle errors gracefully.
- Errors in Swift are represented by types that conform to the `Error` protocol.
- You can define your own error types by creating an enum or struct that conforms to the `Error` protocol.
- Swift uses `do-catch` blocks to handle errors. You can use `try` to call a function that can throw an error, and `catch` to handle the error if it occurs.
- You can also use `try?` to convert a throwing function into an optional value, or `try!` to assert that a function will not throw an error.
- When using `try?`, if the function throws an error, it returns `nil` instead of throwing the error.
- When using `try!`, if the function throws an error, it will crash the program.
- It's important to handle errors appropriately to ensure a good user experience and to prevent crashes.
- You can also use `throws` in function signatures to indicate that a function can throw an error.

## localizedDescription
- The `localizedDescription` property of an error provides a user-friendly description of the error.
- This property is useful for displaying error messages to users in a way that is easy to understand.

```swift

Auth.authError.localizedDescription
// Example of using localizedDescription
// Output: "The email address is badly formatted."
```
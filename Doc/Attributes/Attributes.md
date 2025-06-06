# Attributes in Swift

Attributes in Swift are special annotations that provide additional information about declarations. They can modify the behavior of classes, structures, functions, and other entities in Swift. Attributes are often used to control access, specify behaviors, or provide metadata.

## Common Attributes
- `@objc` - Indicates that a Swift declaration can be accessed from Objective-C code.
- `@available` - Specifies the availability of a declaration across different platforms and versions.
- `@discardableResult` - Allows a function to be called without using its return value without generating a warning.
- `@escaping` - Indicates that a closure can outlive the scope in which it was created, allowing it to be stored and called later.
- `@autoclosure` - Automatically wraps an expression in a closure, allowing it to be passed as a parameter without explicitly writing the closure syntax.
- `@MainActor` - Indicates that a declaration should be executed on the main thread, ensuring thread safety for UI updates.
- `@frozen` - Indicates that a type's layout is stable and will not change in future versions, allowing for optimizations in binary compatibility.
- `@dynamicMemberLookup` - Allows a type to support dynamic member access, enabling properties to be accessed using subscript syntax.
- `@propertyWrapper` - Defines a custom property wrapper that can encapsulate additional behavior for properties.
- `@resultBuilder` - Allows the creation of custom DSLs (Domain-Specific Languages) by building complex expressions from simpler components.

## @MainActor
The `@MainActor` attribute is used to ensure that a declaration is executed on the main thread. This is particularly important for UI updates in SwiftUI or UIKit, as they must be performed on the main thread to avoid concurrency issues.

```swift
@MainActor // Example of using @MainActor
class MyViewModel: ObservableObject {
    @Published var data: String = ""

    func fetchData() {
        // This function will be executed on the main thread
        data = "Fetched Data"
    }
}
```

## @propertyWrapper

The `@propertyWrapper` attribute allows you to define a custom wrapper for properties, encapsulating additional behavior such as validation, transformation, or storage. This can help reduce boilerplate code and improve code organization.

```swift
@propertyWrapper // Example of using @propertyWrapper
struct Clamped<Value: Comparable> {
    private var value: Value
    private let range: ClosedRange<Value>
    var wrappedValue: Value {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}
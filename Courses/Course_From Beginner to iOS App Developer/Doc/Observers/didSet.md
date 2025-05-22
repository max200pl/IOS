# didSet in swift

## What is didSet?
`didSet` is a property observer in Swift that is called immediately after the value of a property is set. It allows you to perform additional actions or updates whenever the property's value changes. This can be useful for updating the UI, triggering notifications, or performing calculations based on the new value.

## Example of didSet
```swift
class Person {
    var name: String {
        didSet {
            print("Name changed to \(name)")
        }
    }

    init(name: String) {
        self.name = name
    }
}
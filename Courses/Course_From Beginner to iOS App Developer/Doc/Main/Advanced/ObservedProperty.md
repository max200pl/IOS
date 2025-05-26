# ObservedProperty in swift

Triggered by changes in the value of a property, allowing for automatic updates to the UI or other components that depend on that property.

## willSet and didSet

In Swift, `willSet` and `didSet` are property observers that allow you to respond to changes in a property's value. They are used to perform actions before or after a property's value is set.
### Example of willSet and didSet

```swift
var score: Int = 0 {
    willSet {
        print("About to set score to \(newValue)")
    }
    didSet {
        print("Score changed from \(oldValue) to \(score)")
    }
}
// Usage
score = 10
// Output:
// About to set score to 10
// Score changed from 0 to 10
```



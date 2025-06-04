# MemoryManagement in Swift

## weak self

In Swift, `weak self` is used to prevent strong reference cycles in closures. When a closure captures `self`, it creates a strong reference to the instance, which can lead to memory leaks if the closure is retained by the instance itself. By using `weak self`, you ensure that the closure does not hold a strong reference to `self`, allowing it to be deallocated when no longer needed.

### Example of weak self

```swift
class MyClass {
    var name: String
    init(name: String) {
        self.name = name
    }
    func doSomething() {
        // Using weak self in a closure
        let closure = { [weak self] in
            guard let self = self else { return }
            print("Doing something with \(self.name)")
        }
        closure()
    }
}

let myObject = MyClass(name: "Example")
myObject.doSomething() // Output: Doing something with Example
```
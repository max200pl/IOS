# Lazy Loading in Swift

## Key lazy

- Lazy loading is a design pattern that defers the initialization of an object until it is needed.
- It is useful for improving performance and reducing memory usage, especially when dealing with large objects or resources that may not be needed immediately.
loading concepts
- In Swift, you can use the `lazy` keyword to declare a property as lazy.
- Lazy properties are not initialized until they are accessed for the first time.

### Example of Lazy Loading
```swift
class LazyLoadingExample {
    lazy var expensiveResource: String = {
        print("Expensive resource initialized")
        return "Expensive Resource"
    }()

    func useResource() {
        print("Using resource: \(expensiveResource)")
    }
}
let example = LazyLoadingExample()
example.useResource() // Output: Expensive resource initialized
// Output: Using resource: Expensive Resource
```
- In this example, the `expensiveResource` property is declared as lazy.
- The initialization of the resource is deferred until the `useResource` method is called.
- The first time `expensiveResource` is accessed, the initialization code is executed, and the resource is created.
- Subsequent accesses to `expensiveResource` will use the already initialized value.
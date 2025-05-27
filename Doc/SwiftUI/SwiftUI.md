# SwiftUI

## Decorators
### @State
- A property wrapper that allows you to create a mutable state for a view.
- When the state changes, the view is automatically updated.
- Use `@State` for simple, local state management within a view.
- Example:
```swift
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1
            }
        }
    }
}
```
### @Binding
- A property wrapper that creates a two-way binding between a view and its parent.
- Use `@Binding` to pass state from a parent view to a child view.
- Example:
```swift
struct ParentView: View {
    @State private var count = 0

    var body: some View {
        ChildView(count: $count)
    }
}
struct ChildView: View {
    @Binding var count: Int

    var body: some View {
        Button("Increment") {
            count += 1
        }
    }
}
```
### @ObservedObject
- A property wrapper that allows you to observe changes in an external object.
- Use `@ObservedObject` for state management in a view model or when using Combine.
- Example:
```swift
class CounterModel: ObservableObject {
    @Published var count = 0
}
struct CounterView: View {
    @ObservedObject var model = CounterModel()

    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") {
                model.count += 1
            }
        }
    }
}
```
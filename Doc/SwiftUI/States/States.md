# States in SwiftUI

## Overview
States in SwiftUI are used to manage the dynamic data that drives the user interface. They allow views to react to changes in data and update accordingly. SwiftUI provides several property wrappers to handle state management effectively.


## Property Wrappers for State Management

### @State
- A property wrapper that allows you to create a mutable state for a view.
- When the state changes, the view is automatically updated.
- Use `@State` for simple, local state management within a view.

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
#### Notice @State
- `@State` is used to declare a mutable state variable.
- Если стейт обновлися но нет мес в юи где используется этот стейт, то юи не обновится.

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
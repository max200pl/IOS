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

#### State binding changes use `$` prefix

```swift
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1
            }
            // Binding to the state variable
            Toggle(isOn: $count) {
                Text("Toggle Count")
            }
        }
    }
}
```

## @Binding
- A property wrapper that creates a two-way connection to a state variable.
- It allows a child view to read and write to a state variable owned by a parent view.
```swift
struct ParentView: View {
    @State private var isOn = false

    var body: some View {
        ChildView(isOn: $isOn)
    }
}
struct ChildView: View {
    @Binding var isOn: Bool

    var body: some View {
        Toggle("Switch", isOn: $isOn)
    }
}
```

## @ObservedObject
- A property wrapper that allows a view to observe an object that conforms to the `ObservableObject` protocol.
- When the observed object changes, the view is automatically updated.
```swift
class CounterModel: ObservableObject {
    @Published var count = 0
}

@main
struct MyApp: App {
    @StateObject private var counter = CounterModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(counter)
        }
    }
}
struct ContentView: View {
    @EnvironmentObject var counter: CounterModel

    var body: some View {
        VStack {
            Text("Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
        }
    }
}
```


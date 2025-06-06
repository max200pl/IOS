# Environment Values in SwiftUI

https://developer.apple.com/documentation/swiftui/environmentvalues

## Overview

Environment values in SwiftUI provide a way to pass data down the view hierarchy without explicitly passing it through each view. This is particularly useful for global settings or configurations that many views might need to access, such as color schemes, accessibility settings, or user preferences.

### Hierarchy of Environment Values

The following diagram illustrates the hierarchy of views and the availability of the `colorScheme` environment value:

```
Root View (colorScheme: .dark)
├── Child View 1 (colorScheme: .light)
│   ├── Grandchild View 1.1 (colorScheme: .light)
│   │   └── Great-Grandchild View 1.1.1 (colorScheme: .light)
│   └── Grandchild View 1.2 (colorScheme: .light)
└── Child View 2 (colorScheme: .dark)
    ├── Grandchild View 2.1 (colorScheme: .dark)
    │   └── Great-Grandchild View 2.1.1 (colorScheme: .dark)
    └── Grandchild View 2.2 (colorScheme: .dark)
```

In this hierarchy:
- The `Root View` starts with a `.dark` color scheme.
- `Child View 1` overrides the color scheme to `.light`, which propagates to its descendants.
- `Child View 2` retains the `.dark` color scheme from the `Root View`.
- `Grandchild View 2.1` explicitly sets the color scheme back to `.dark`, affecting only its descendants.
- Views without an explicit override inherit the color scheme from their closest ancestor.



## @Environment Usage

- .presentationMode is used to control the presentation of views, such as modals or sheets.

```swift
struct ChildView: View {
     @State private var isPresented = false

    var body: some View {
        VStack {
            Text("Child View")
                .padding()
            Button("Show Modal") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) { // Presenting a modal view
                ModalView()
            }
        }
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Modal View")
                .padding()
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
```

## Example 2 Color Scheme

- Like environment values, the `@Environment` property wrapper allows you to access system-wide settings such as the color scheme.

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Current Color Scheme: \(colorScheme == .dark ? "Dark" : "Light")")
                .padding()
            ChildView()
        }
    }
}
```

## .task in SwiftUI

The `.task` modifier in SwiftUI is used to perform asynchronous tasks when a view appears. It allows you to run code that fetches data or performs other operations without blocking the main thread.

```swift
struct ContentView: View {
    @State private var data: String = "Loading..."

    var body: some View {
        VStack {
            Text(data)
                .padding()
        }
        .task {
            await fetchData()
        }
    }

    func fetchData() async {
        // Simulate a network call
        try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
        data = "Data Loaded"
    }
}
```
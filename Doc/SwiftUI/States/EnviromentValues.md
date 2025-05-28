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

## Example Usage

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
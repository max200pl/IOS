# Context Menu in SwiftUI

## Overview
The Context Menu in SwiftUI allows you to present a menu of actions when the user long-presses on a view. This is useful for providing additional options without cluttering the UI.
## Basic Usage
To create a context menu, you can use the `.contextMenu` modifier on any view. Here’s a simple example:

```swift
import SwiftUI
struct ContentView: View {
    var body: some View {
        Text("Long Press Me")
            .padding()
            .contextMenu {
                Button(action: {
                    print("Action 1")
                }) {
                    Text("Action 1")
                    Image(systemName: "star")
                }

                Button(action: {
                    print("Action 2")
                }) {
                    Text("Action 2")
                    Image(systemName: "heart")
                }

                Button(action: {
                    print("Action 3")
                }) {
                    Text("Action 3")
                    Image(systemName: "trash")
                }
            }
    }
}
```
## Customization
You can customize the context menu by adding images, changing the text, and even grouping actions. Here’s an example with grouped actions:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Long Press Me")
            .padding()
            .contextMenu {
                Section(header: Text("Favorites")) {
                    Button(action: {
                        print("Favorite 1")
                    }) {
                        Text("Favorite 1")
                        Image(systemName: "star.fill")
                    }

                    Button(action: {
                        print("Favorite 2")
                    }) {
                        Text("Favorite 2")
                        Image(systemName: "star.lefthalf.fill")
                    }
                }

                Section(header: Text("Actions")) {
                    Button(action: {
                        print("Action 1")
                    }) {
                        Text("Action 1")
                        Image(systemName: "pencil")
                    }

                    Button(action: {
                        print("Action 2")
                    }) {
                        Text("Action 2")
                        Image(systemName: "trash")
                    }
                }
            }
    }
}
```
# BarButton in SwiftUI

## How to use BarButton in SwiftUI

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .navigationBarTitle("Title")
            .navigationBarItems(leading: Button(action: {
                // Action for leading button
            }) {
                Text("Leading")
            }, trailing: Button(action: {
                // Action for trailing button
            }) {
                Text("Trailing")
            })
        }
    }
}
```


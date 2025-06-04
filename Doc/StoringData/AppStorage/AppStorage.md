# App Storage

App Storage is a feature in SwiftUI that allows you to store simple data types in the app's storage, such as user preferences or settings. It uses the `@AppStorage` property wrapper to read and write values from UserDefaults.

## Usage

To use `@AppStorage`, you need to import SwiftUI and declare a property with the `@AppStorage` attribute. Here's an example:

```swift
import SwiftUI
struct ContentView: View {
    @AppStorage("username") var username: String = "Guest"

    var body: some View {
        VStack {
            Text("Hello, \(username)!")
            TextField("Enter your name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}


```
# Color HEX  in SwiftUI

## Introduction
This document provides a guide on how to use HEX colors in SwiftUI. It includes examples of how to create colors using HEX values and how to use them in your SwiftUI views.

## Creating Colors from HEX Values
You can create a color from a HEX value using the following extension on `Color`:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
```

## Usage Example
```swift
import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(Color(hex: "#FF5733")) // Using HEX color
                .foregroundColor(.white)
                .cornerRadius(10)

            Text("SwiftUI with HEX Colors")
                .padding()
                .background(Color(hex: "#33FF57")) // Using HEX color
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
## Conclusion
This document provides a simple way to use HEX colors in SwiftUI. By using the provided extension, you can easily create colors from HEX values and apply them to your views. This allows for more flexibility and customization in your SwiftUI applications.


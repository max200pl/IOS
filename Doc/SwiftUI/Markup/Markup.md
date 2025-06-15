# Markup in SwiftUI

## Markup
- SwiftUI supports a subset of Markdown for text formatting.
- You can use Markdown syntax to format text in `Text` views.

## HStack

- `HStack` is a horizontal stack that arranges its children in a horizontal line.
- It is used to create horizontal layouts in SwiftUI.

## Modifiers

- Modifiers are methods that you can call on views to change their appearance or behavior.
- They are used to customize views in SwiftUI.
- Common modifiers include `.padding()`, `.background()`, and `.foregroundColor()`.
- Modifiers can be chained together to apply multiple changes to a view.

### .contentShape
- The `.contentShape` modifier defines the tappable area of a view.

## .onTapGesture
- The `.onTapGesture` modifier allows you to add a tap gesture recognizer to a view.
- It is used to handle tap events on views.

## .toolbar
- The `.toolbar` modifier adds a toolbar to a view.
- Toolbars can contain buttons, menus, and other controls.

- Example:
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Tapped!")
                }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Action") {
                    print("Toolbar button tapped")
                }
            }
        }
    }
}
```


## Accessibility identifiers

- Accessibility identifiers are used to identify views for UI testing.
- They are set using the `.accessibilityIdentifier` modifier.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .accessibilityIdentifier("greetingText")
    }
}
```

```swift
import XCTest
@testable import YourApp
class ContentViewTests: XCTestCase {
    func testGreetingTextAccessibilityIdentifier() {
        let contentView = ContentView()
        let identifier = contentView.accessibilityIdentifier
        XCTAssertEqual(identifier, "greetingText")
    }
}
```
# Numbers in Swift

## SGFloat
- `CGFloat` is a type used to represent floating-point numbers in Swift, particularly for graphics and UI-related calculations.
- It is often used in contexts where you need to specify dimensions, positions, or other values that require decimal precision.
- `CGFloat` is platform-dependent, meaning its size can vary between 32-bit and 64-bit architectures. On 32-bit architectures, it is equivalent to `Float`, while on 64-bit architectures, it is equivalent to `Double`.
- This allows for better performance and memory usage when working with graphics and UI elements.
- `CGFloat` is commonly used in UIKit and Core Graphics frameworks for defining sizes, positions, and other graphical attributes.
- It is also used in SwiftUI for defining dimensions and positions of views.
- When performing calculations with `CGFloat`, you may need to convert between `CGFloat` and other numeric types (like `Int`, `Float`, or `Double`) using type casting.
- You can create a `CGFloat` value using the following syntax:
```swift
let myFloat: CGFloat = 10.5
```
- You can also convert other numeric types to `CGFloat` using the following syntax:
```swift
let myInt: Int = 5
let myFloat: CGFloat = CGFloat(myInt) // Convert Int to CGFloat
```

### When to use CGFloat
- Use `CGFloat` when working with graphics, UI elements, or any calculations that require decimal precision.

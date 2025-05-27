# Extensions in Swift

    Extensions in Swift allow you to add new functionality to existing classes, structures, enumerations, or protocols. This feature enables you to extend the capabilities of types without modifying their original source code. Extensions can be used to add methods, properties, initializers, and conformances to protocols.

### Key Concepts

- **Adding Methods**: You can add new instance or type methods to an existing type.

    ```swift
        extension String {
            func reversedString() -> String {
                return String(self.reversed())
            }
        }
    ```
- **Initializers**: You can add new initializers to a type.

    ```swift
        extension Int {
            init?(binaryString: String) {
                self.init(binaryString, radix: 2)
            }
        }
    ```
- **Computed Properties**: You can add computed properties to provide additional functionality.

    ```swift
        extension Double {
            var squared: Double {
                return self * self
            }
        }
    ```
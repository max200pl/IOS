# Default Protocols in Swift

    Default protocols in Swift allow you to provide default implementations for methods and properties in a protocol. This feature enables you to define common behavior that can be shared across multiple conforming types without requiring them to implement the methods themselves.

    This can help reduce code duplication and improve maintainability.
    Default protocols are particularly useful when you want to provide a common set of functionalities for different types while still allowing them to override the default behavior if needed.


## Decodable, Encodable, and Codable

    The `Decodable`, `Encodable`, and `Codable` protocols are part of the Swift standard library and are used for encoding and decoding data types to and from various formats, such as JSON.

    - `Decodable`: A protocol that allows a type to be initialized from an external representation (e.g., JSON). Types conforming to this protocol can be decoded using a decoder.
    - `Encodable`: A protocol that allows a type to be encoded into an external representation (e.g., JSON). Types conforming to this protocol can be encoded using an encoder.
    - `Codable`: A type alias that combines both `Decodable` and `Encodable`. Types conforming to this protocol can be both encoded and decoded.

    By conforming to these protocols, you can easily convert your custom types to and from JSON or other formats without writing boilerplate code.
## Example
```swift
import Foundation
// Define a struct that conforms to Codable
struct User: Codable {
    let id: Int
    let name: String
    let email: String
}
// Create an instance of the struct
let user = User(id: 1, name: "John Doe", email: "max @example.com")
// Encode the struct to JSON
let encoder = JSONEncoder()
if let jsonData = try? encoder.encode(user) {
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("JSON String: \(jsonString)")
    }
}
// Decode the JSON back to the struct
let decoder = JSONDecoder()
if let decodedUser = try? decoder.decode(User.self, from: jsonData) {
    print("Decoded User: \(decodedUser)")
}
```
## Conclusion
    Default protocols in Swift provide a powerful way to define common behavior for types while allowing flexibility for customization. By using `Decodable`, `Encodable`, and `Codable`, you can easily work with data serialization and deserialization, making it easier to handle JSON and other formats in your applications.

## Best Practices
- Use default protocols to provide common functionality across multiple types.

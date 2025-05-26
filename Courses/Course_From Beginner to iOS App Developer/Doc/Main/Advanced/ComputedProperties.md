# Setters And Getters in Swift

## Computed Properties

Computed properties are properties that do not store a value but instead provide a getter and an optional setter to retrieve and set other properties or values indirectly. They are defined using the `get` and `set` keywords.
### Example of Computed Properties

```swift
struct Rectangle {
    var width: Double
    var height: Double

    // Computed property to calculate the area of the rectangle
    var area: Double {
        get {
            return width * height
        }
        set(newArea) {
            // Assuming the width remains constant, we can adjust the height
            height = newArea / width
        }
    }
}
// Usage
var rect = Rectangle(width: 5.0, height: 10.0)

print("Area of rectangle: \(rect.area)") // Output: Area of rectangle: 50.0
```

### Example 2 of Computed Properties

```swift
var temperatureInCelsius: Double {
    get {
        return (temperatureInFahrenheit - 32) * 5 / 9
    }
    set(newTemperature) {
        temperatureInFahrenheit = newTemperature * 9 / 5 + 32
    }
}

var temperatureInFahrenheit: Double = 32.0
// Usage
print("Temperature in Celsius: \(temperatureInCelsius)") // Output: Temperature in Celsius: 0.0
temperatureInCelsius = 100.0
print("Temperature in Fahrenheit: \(temperatureInFahrenheit)") // Output: Temperature in Fahrenheit: 212.0
```


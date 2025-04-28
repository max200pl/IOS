# Structures in Swift

Structures are a fundamental building block in Swift programming. They are used to create complex data types that can encapsulate both data and behavior. In this document, we will cover the basics of structures in Swift, including their declaration, properties, methods, and usage.

## Example of a Structure

```swift
struct Town {
    var name: String
    var population: Int
    var citizens: ["Alice", "Bob", "Charlie"]
    var resources: ["Grain": 100, "Wood": 50, "Stone": 30]

    func fortify() {
        print("\(name) is fortified!")
    }
}

var myTown = Town(name: "MyTown", population: 1000)

myTown.resources["Grain"] = 200
myTown.resources["Wood"] = 100
myTown.resources["Stone"] = 50

print("Town Name: \(myTown.name)")
print("Population: \(myTown.population)")
print("Resources: \(myTown.resources)")

myTown.fortify()
```

## Example Black Box

```swift
struct BlackBox {
    var name: String
    var version: String
    var features: [String]

    init(name: String, version: String, features: [String]) {
        self.name = name
        self.version = version
        self.features = features
    }

    func displayInfo() {
        print("Black Box Name: \(name)")
        print("Version: \(version)")
        print("Features: \(features.joined(separator: ", "))")
    }
}

var myBlackBox = BlackBox(name: "MyBlackBox", version: "1.0", features: ["Feature1", "Feature2", "Feature3"])

myBlackBox.displayInfo()
```
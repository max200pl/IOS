# Dictionaries in Swift

## What is a Dictionary?

A dictionary is a collection type in Swift that stores key-value pairs. Each key in a dictionary must be unique, and it is used to access the corresponding value. Dictionaries are unordered collections, meaning that the order of the elements is not guaranteed.

## Creating a Dictionary

You can create a dictionary using the following syntax:

```swift
var dictionaryName: [KeyType: ValueType] = [:]
```
or

```swift
var dictionaryName = [KeyType: ValueType]()
```
or

```swift
var dictionaryName = [KeyType: ValueType] {
    key1: value1,
    key2: value2,
    ...
}
```
### Example

```swift
var ages: [String: Int] = [:]
ages["Alice"] = 25
ages["Bob"] = 30
ages["Charlie"] = 35
```
or

```swift
var ages = [
    "Alice": 25,
    "Bob": 30,
    "Charlie": 35
]
```
### Accessing Values
You can access the value associated with a key using subscript syntax:

```swift
let aliceAge = ages["Alice"] // 25
```
### Updating Values
You can update the value associated with a key using subscript syntax:

```swift
ages["Alice"] = 26
```
### Removing Values
You can remove a key-value pair from a dictionary using the `removeValue(forKey:)` method:

```swift
ages.removeValue(forKey: "Bob")
```
### Iterating Over a Dictionary
You can iterate over the key-value pairs in a dictionary using a `for-in` loop:

```swift
for (key, value) in ages {
    print("\(key): \(value)")
}
```
### Checking for Existence of a Key
You can check if a key exists in a dictionary using the `contains` method:

```swift
if ages.keys.contains("Alice") {
    print("Alice is in the dictionary")
}
```
### Merging Dictionaries
You can merge two dictionaries using the `merging(_:uniquingKeysWith:)` method:

```swift
let additionalAges = ["David": 40, "Eve": 45]
ages = ages.merging(additionalAges) { (current, _) in current }
```
or

```swift
ages.merge(additionalAges) { (current, _) in current }
```
### Dictionary Properties
- `count`: Returns the number of key-value pairs in the dictionary.
- `isEmpty`: Returns `true` if the dictionary is empty, otherwise `false`.
- `keys`: Returns a collection of the keys in the dictionary.
- `values`: Returns a collection of the values in the dictionary.
- `first`: Returns the first key-value pair in the dictionary as an optional tuple.
- `randomElement()`: Returns a random key-value pair from the dictionary as an optional tuple.
- `mapValues(_:)`: Returns a new dictionary containing the results of mapping the given closure over the values of the original dictionary.
- `filter(_:)`: Returns a new dictionary containing the key-value pairs that satisfy the given predicate.
- `reduce(into:_:)`: Combines the elements of the dictionary into a single value using the given closure.
- `sorted(by:)`: Returns an array of the key-value pairs sorted by the given closure.

### Dictionary Methods
- `updateValue(_:forKey:)`: Updates the value for the specified key and returns the old value if it exists.
- `removeAll(keepingCapacity:)`: Removes all key-value pairs from the dictionary, optionally keeping the capacity for future use.
- `removeAll()`: Removes all key-value pairs from the dictionary.
- `removeValue(forKey:)`: Removes the value for the specified key and returns it.
- `keys`: Returns a collection of the keys in the dictionary.
- `values`: Returns a collection of the values in the dictionary.
- `mapValues(_:)`: Returns a new dictionary containing the results of mapping the given closure over the values of the original dictionary.
- `filter(_:)`: Returns a new dictionary containing the key-value pairs that satisfy the given predicate.
- `reduce(into:_:)`: Combines the elements of the dictionary into a single value using the given closure.
- `sorted(by:)`: Returns an array of the key-value pairs sorted by the given closure.
- `contains(where:)`: Returns `true` if the dictionary contains a key-value pair that satisfies the given predicate.
- `allSatisfy(_:)`: Returns `true` if all key-value pairs in the dictionary satisfy the given predicate.

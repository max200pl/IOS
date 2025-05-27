# Random in Swift

    Random numbers are often used in programming for various purposes, such as generating random values, simulating randomness, or creating unique identifiers. In Swift, you can generate random numbers using the `random(in:)` method or the `arc4random_uniform()` function.

## Random Number Generation

### Using `random(in:)`

You can generate a random number within a specified range using the `random(in:)` method. This method is available for numeric types such as `Int`, `Double`, and `Float`. Here's an example of generating a random integer between 1 and 10:

```swift
    let randomInt = Int.random(in: 1...10) // Generates a random integer between 1 and 10
```

### Using Random Int range (half-open)

You can also generate a random integer using a half-open range (where the upper bound is exclusive) by using the `..<` operator. Here's an example of generating a random integer between 1 and 9:

```swift
    let randomInt = Int.random(in: 1..<10) // Generates a random integer between 1 and 9
```

### Using Random Bool
You can generate a random boolean value using the `random()` method. Here's an example:

```swift
    let randomBool = Bool.random() // Generates a random boolean value (true or false)
```

#### Using Array.shuffled()
You can shuffle an array to get a random order of its elements. Here's an example:

```swift
    let numbers = [1, 2, 3, 4, 5]
    let shuffledNumbers = numbers.shuffled() // Shuffles the array randomly
```
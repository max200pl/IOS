# Control Flow in Swift

Control flow statements in Swift allow you to control the execution of your code based on certain conditions. The main control flow statements in Swift are `if`, `switch`, `for-in`, `while`, and `repeat-while`.

## If Statement

The `if` statement is used to execute a block of code if a certain condition is true. You can also use `else if` and `else` to handle multiple conditions. Here's an example:

```swift
    let age = 18

    if age < 18 {
        print("You are a minor.")
    } else if age >= 18 && age < 65 {
        print("You are an adult.")
    } else {
        print("You are a senior citizen.")
    }
```

## Switch Statement

The `switch` statement is used to execute different blocks of code based on the value of a variable or constant. It is more powerful than the `if` statement because it can match multiple values and ranges. Here's an example:

```swift
    let number = 3
    switch number {
    case 1:
        print("One")
    case 2:
        print("Two")
    default:
        print("Other")
    }
```
You can also use ranges in a switch statement:

```swift
    let number = 5
    switch number {
    case 1...3:
        print("Between 1 and 3")
    case 4...6:
        print("Between 4 and 6")
    case 3..<5:
        print("Between 3 and 5")
    default:
        print("Other")
    }
```
You can use tuples to match multiple values:

```swift
    let point = (2, 3)

    switch point {
        case (0, 0):
            print("Origin")
        case (let x, 0):
            print("On the x-axis at \(x)")
        case (0, let y):
            print("On the y-axis at \(y)")
        default:
            print("Point is at \(point)")
    }
```

You can also use `where` to add additional conditions to a case:

```swift
    let number = 5
    switch number {
        case 1:
            print("One")
        case 2:
            print("Two")
        case let x where x > 2:
            print("Greater than two")
        default:
            print("Other")
    }
```

You can also use `fallthrough` to execute the next case:

```swift
    let number = 1
    switch number {
    case 1:
        print("One")
        fallthrough // This will execute the next case
    case 2:
        print("Two")
    default:
        print("Other")
    }
```

You can also use `break` to exit a switch statement:

```swift

    let number = 1

    switch number {
        case 1:
            print("One")
            break // This will exit the switch statement
        case 2:
            print("Two")
        default:
            print("Other")
    }
```

## Guard Statement

The `guard` statement is used to check a condition and exit the current scope if the condition is not met. It is often used for early exits in functions or methods when certain conditions are not met. The main advantage of using `guard` is that it helps to keep your code clean and readable by reducing the need for nested if statements. Here's an example:

```swift
    func checkAge(age: Int) {
        guard age >= 18 else {
            print("You are a minor.")
            return
        }
        print("You are an adult.")
    }
```

### Guard with Optional Binding
You can also use `guard` for optional binding, which allows you to safely unwrap optionals:

```swift
    func printName(name: String?) {
        guard let unwrappedName = name else {
            print("Name is nil.")
            return
        }
        print("Name is \(unwrappedName).")
    }
```

### Guard VS If

The main difference between `guard` and `if` is that `guard` requires an else clause, which must exit the current scope (e.g., return, break, continue). This makes `guard` a good choice for early exits in functions or methods. In contrast, `if` does not require an else clause and can be used for more complex conditional logic.

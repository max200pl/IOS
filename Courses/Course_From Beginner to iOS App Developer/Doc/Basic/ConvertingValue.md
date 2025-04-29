# Converting Value in Swift

## Converting Value

### 1. Converting String to Int

```swift
let str = "123"
let intValue = Int(str)
print(intValue) // Optional(123)
```
### 2. Converting String to Double

```swift
let str = "123.45"
let doubleValue = Double(str)
print(doubleValue) // Optional(123.45)
```
### 3. Converting Int to String

```swift
let intValue = 123
let strValue = String(intValue)
print(strValue) // "123"
```
### 4. Converting Double to String

```swift
let doubleValue = 123.45
let strValue = String(doubleValue)
print(strValue) // "123.45"
```
### 5. Converting Int to Double

```swift
let intValue = 123
let doubleValue = Double(intValue)
print(doubleValue) // 123.0
```

## Formatting Numbers

### 1. Formatting Double to String with Two Decimal Places

```swift
let doubleValue = 123.456789
let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.minimumFractionDigits = 2
formatter.maximumFractionDigits = 2
if let formattedString = formatter.string(from: NSNumber(value: doubleValue)) {
    print(formattedString) // "123.46"
}
```
### 2. Formatting Int to String with Comma Separator

```swift
let intValue = 1234567
let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.numberStyle = .decimal
formatter.groupingSeparator = ","
formatter.usesGroupingSeparator = true
if let formattedString = formatter.string(from: NSNumber(value: intValue)) {
    print(formattedString) // "1,234,567"
}
```
### 3. Formatting Double to Currency String

```swift
let doubleValue = 1234.56
let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.currencyCode = "USD"
if let formattedString = formatter.string(from: NSNumber(value: doubleValue)) {
    print(formattedString) // "$1,234.56"
}
```

## Formatting String

### 1. Formatting String to Uppercase

```swift
let str = "hello"
let upperStr = str.uppercased()
print(upperStr) // "HELLO"
```
### 2. Formatting String to Lowercase

```swift
let str = "HELLO"
let lowerStr = str.lowercased()
print(lowerStr) // "hello"
```

### 3. Formatting String to Capitalized

```swift
let str = "hello world"
let capitalizedStr = str.capitalized
print(capitalizedStr) // "Hello World"
```

### 4. Formatting String to slice first 3 characters

```swift
let str = "hello world"
let startIndex = str.index(str.startIndex, offsetBy: 3)
let endIndex = str.index(str.startIndex, offsetBy: 6)
let range = startIndex..<endIndex
let slicedStr = str[range]
print(slicedStr) // "lo "
```
### 5. Formatting String to slice last 3 characters

```swift
let str = "hello world"
let startIndex = str.index(str.endIndex, offsetBy: -3)
let endIndex = str.index(str.endIndex, offsetBy: 0)
let range = startIndex..<endIndex
let slicedStr = str[range]
print(slicedStr) // "rld"
```

### 6. String use format

```swift
let name = "John"
let age = 30
let formattedString = String(format: "My name is %@ and I am %d years old.", name, age)
print(formattedString) // "My name is John and I am 30 years old."
```
### 7. String use interpolation

```swift
let name = "John"
let age = 30
let formattedString = "My name is \(name) and I am \(age) years old."
print(formattedString) // "My name is John and I am 30 years old."
```

### 8 . String use format with "%@" and "%d"

```swift
let name = "John"
let age = 30
let formattedString = String(format: "My name is %@ and I am %d years old.", name, age)
print(formattedString) // "My name is John and I am 30 years old."
```
# Data in Swift

     In Swift, the `Date` type represents a specific point in time, independent of any calendar or time zone. It is used to work with dates and times in a variety of formats and provides methods for manipulating and formatting date values.

## Creating a Date
You can create a `Date` object using the current date and time or by specifying a specific date and time. Here are some examples:

```swift
let currentDate = Date() // Current date and time
let specificDate = Date(timeIntervalSince1970: 0) // January 1, 1970
var now = Date().timeIntervalSince1970
```
# UserDefaults

UserDefaults is a simple way to store small amounts of data persistently across app launches. It is typically used for storing user preferences, settings, and other lightweight data.


## Storing Data with UserDefaults
- UserDefaults allows you to store data in key-value pairs.
- You can store various data types, including strings, numbers, booleans, arrays, and dictionaries.
- UserDefaults is not suitable for storing large amounts of data or complex data structures.
- It is best used for lightweight data that needs to persist between app launches.
- UserDefaults is automatically synchronized with the app's sandbox, so you don't need to worry about file management.

## Example of Storing Data
```swift
import Foundation

// Storing data in UserDefaults
let defaults = UserDefaults.standard
defaults.set("John Doe", forKey: "username")
defaults.set(25, forKey: "age")
defaults.set(true, forKey: "isLoggedIn")
defaults.set(["Swift", "Objective-C"], forKey: "languages")
defaults.set(["key1": "value1", "key2": "value2"], forKey: "userSettings")

// Retrieving data from UserDefaults
if let username = defaults.string(forKey: "username") {
    print("Username: \(username)")
}

if let age = defaults.value(forKey: "age") as? Int {
    print("Age: \(age)")
}

if let isLoggedIn = defaults.value(forKey: "isLoggedIn") as? Bool {
    print("Is Logged In: \(isLoggedIn)")
}

```
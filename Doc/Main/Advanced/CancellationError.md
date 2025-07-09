# CancellationError in Swift

## 🧠 What is `CancellationError`?

`CancellationError` is a built-in Swift error type thrown when an asynchronous task is cancelled.
It is part of Swift's structured concurrency model (`async/await`).

---

## 🔧 When does it occur?

It occurs when:

* A `Task` is cancelled using `.cancel()`
* A `try` or `try await` inside the task checks for cancellation and throws `CancellationError`

---

## 📦 Example 1: Basic Task Cancellation

```swift
import Foundation

func loadData() async throws {
    try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
    print("Data loaded")
}

let task = Task {
    try await loadData()
}

task.cancel()

Task {
    do {
        try await task.value
    } catch is CancellationError {
        print("❌ Task was cancelled")
    } catch {
        print("Other error: \(error)")
    }
}
```

---

## 📦 Example 2: Manual Check with `Task.checkCancellation()`

```swift
func loadWithCheck() async throws {
    try Task.checkCancellation() // Optional check
    print("Still running...")
    try await Task.sleep(nanoseconds: 1_000_000_000)
    try Task.checkCancellation()
    print("Finished")
}

let task = Task {
    try await loadWithCheck()
}

task.cancel()
```

---

## 🫲 Handling `CancellationError`

```swift
do {
    try await someTask()
} catch is CancellationError {
    print("Cancelled intentionally")
} catch {
    print("Failed with error: \(error)")
}
```

---

## 🤩 Using `Task.checkCancellation()` in Loops

```swift
for i in 1...10 {
    try Task.checkCancellation()
    print("Processing \(i)...")
    try await Task.sleep(nanoseconds: 500_000_000)
}
```

---

## ✅ Summary

* `CancellationError` indicates graceful task termination.
* Use `.cancel()` to stop tasks and handle it with `catch`.
* Add `Task.checkCancellation()` in long-running loops or operations.

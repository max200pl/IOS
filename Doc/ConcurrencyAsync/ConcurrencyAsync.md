# Concurrency Async in swift

## Introduction

Concurrency in Swift allows developers to write asynchronous code that is easier to read and maintain. It introduces structured concurrency, which helps manage the lifecycle of tasks and their dependencies.

## Key Concepts

- **Tasks**: The fundamental unit of concurrency in Swift. Tasks can be created using `Task {}`.
- **Async/Await**: Functions can be marked with `async` to indicate they can perform asynchronous operations. You can use `await` to call these functions.
- **Actors**: A new reference type that protects its mutable state from

## Tasks

Tasks are the building blocks of concurrency in Swift. You can create a task using the `Task` initializer, which allows you to run code asynchronously.

```swift
Task {
    // Asynchronous code here
    let result = await fetchData()
    print(result)
}other tasks, ensuring thread safety.
```

## Async/Await
Async functions are defined with the `async` keyword, and you can call them using `await`. This allows you to write asynchronous code that looks synchronous.

```swifts
func fetchData() async -> String {
    // Simulate a network call
    return "Data fetched"
}
```
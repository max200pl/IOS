# DispatchQueue in Swift

## What is DispatchQueue?

`DispatchQueue` is a class in Swift that provides a way to manage the execution of tasks concurrently or serially. It is part of the Grand Central Dispatch (GCD) framework, which is designed to optimize application performance by efficiently managing the execution of tasks on different threads.

## Types of Dispatch Queues

- **Serial Dispatch Queue**: A serial queue executes tasks one at a time in the order they are added. This is useful when you need to ensure that tasks are executed in a specific order.

- **Concurrent Dispatch Queue**: A concurrent queue executes tasks concurrently, allowing multiple tasks to run at the same time. This is useful for tasks that can be performed independently of each other.
- **Main Dispatch Queue**: The main queue is a serial queue that executes tasks on the main thread. This is where all UI updates should occur, as UIKit is not thread-safe.
- **Global Dispatch Queue**: Global queues are concurrent queues that are shared by the system. They are categorized by quality of service (QoS) levels, which determine the priority of tasks executed on the queue.
- **Custom Dispatch Queue**: You can create your own serial or concurrent dispatch queues to manage tasks specific to your application.

## Creating a Dispatch Queue

You can create a custom dispatch queue using the `DispatchQueue` class. Here's an example of creating a serial queue:

```swift
let serialQueue = DispatchQueue(label: "com.example.serialQueue")
```
You can create a concurrent queue using the following code:

```swift
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
```
## Adding Tasks to a Dispatch Queue

You can add tasks to a dispatch queue using the `async` or `sync` methods. The `async` method adds a task to the queue and returns immediately, while the `sync` method waits for the task to complete before returning.
### Asynchronous Task

```swift
serialQueue.async {
    print("Task 1")
}
serialQueue.async {
    print("Task 2")
}
```
### Synchronous Task

```swift
serialQueue.sync {
    print("Task 1")
}
serialQueue.sync {
    print("Task 2")
}
```

# Progress in Swift

## What is Progress?

A progress object is a representation of the progress of a task or operation. It provides information about the current state of the task, such as the amount of work completed, the total amount of work, and any additional details about the task. Progress objects are commonly used in asynchronous operations, such as downloading files or performing long-running tasks, to provide feedback to users about the status of the operation.

## Creating a Progress Object

You can create a progress object using the `Progress` class. Here's an example of creating a progress object for a task that has a total of 100 units of work:

```swift
let progress = Progress(totalUnitCount: 100)
```
In this example, the `totalUnitCount` parameter specifies the total amount of work for the task.
You can also create a progress object with an initial completed unit count:

```swift
let progress = Progress(totalUnitCount: 100)
progress.completedUnitCount = 50
```
In this example, the `completedUnitCount` property is set to 50, indicating that half of the work has been completed.

## Updating Progress
You can update the progress object by incrementing the completed unit count. Here's an example of updating the progress object as work is completed:

```swift
progress.completedUnitCount += 10
```
In this example, the completed unit count is incremented by 10, indicating that 10 more units of work have been completed.
## Observing Progress
You can observe changes to the progress object using Key-Value Observing (KVO) or by using the `addObserver` method. Here's an example of observing progress changes:

```swift
progress.addObserver(self, forKeyPath: "fractionCompleted", options: [.new, .old], context: nil)
```
In this example, the `fractionCompleted` property is observed for changes. You can implement the `observeValue(forKeyPath:of:change:context:)` method to handle updates to the progress object:

```swift
override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "fractionCompleted" {
        let fractionCompleted = progress.fractionCompleted
        print("Progress: \(fractionCompleted * 100)%")
    }
}
```
In this example, the `observeValue(forKeyPath:of:change:context:)` method is overridden to handle updates to the `fractionCompleted` property. The progress percentage is printed to the console.

## Canceling Progress
You can cancel a progress object by calling the `cancel()` method. This will mark the progress object as canceled and prevent any further updates:

```swift
progress.cancel()
```
In this example, the `cancel()` method is called to cancel the progress object.

## Conclusion
In this document, we have covered the basics of using progress objects in Swift. Progress objects provide a way to represent the progress of tasks and operations, allowing you to provide feedback to users about the status of long-running tasks. By creating and updating progress objects, you can effectively manage and monitor the progress of your tasks in Swift applications.
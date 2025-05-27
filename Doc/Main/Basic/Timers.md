# Timers in Swift

Timers in Swift are used to schedule tasks to be executed
after a certain time interval. They are useful for creating periodic tasks, such as updating the UI or performing background operations. In Swift, you can use the `Timer` class to create and manage timers.

## Creating a Timer

You can create a timer using the `Timer` class. Here's an example of creating a timer that fires every second:

```swift
let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    print("Timer fired!")
}
```
In this example, the timer will fire every second and execute the closure that prints "Timer fired!".
You can also create a timer that fires only once by setting the `repeats` parameter to `false`:

```swift
let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
    print("Timer fired after 5 seconds!")
}
```
In this example, the timer will fire once after 5 seconds and execute the closure that prints "Timer fired after 5 seconds!".

### Timer with @objc

If you need to use a timer with a method that is not a closure, you can use the `@objc` attribute to create a method that can be called by the timer:

```swift
@objc func timerFired() {
    print("Timer fired!")
}
let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
```
In this example, the `timerFired` method will be called every second when the timer fires.

## Invalidating a Timer
To stop a timer, you can call the `invalidate()` method on the timer instance. This will stop the timer and release any resources associated with it:

```swift

var timer = Timer()

timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    print("Timer fired!")
}
// Stop the timer
timer.invalidate()
```
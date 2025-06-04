# AsyncThrowing Stream in Swift

💡 Почему это удобно?
✅ Позволяет обходить огромные списки (файлы, данные) без блокировки.
✅ Не нужно загружать все в память сразу — элементы поступают постепенно (удобно для больших каталогов файлов).

## Introduction
`AsyncThrowingStream` is a powerful feature in Swift that allows you to create a stream of asynchronous values that can also throw errors. This is particularly useful when dealing with sequences of data that may fail at some point, such as network requests or file operations.

## Creating an AsyncThrowingStream
You can create an `AsyncThrowingStream` using a closure that provides a continuation. The continuation allows you to yield values and throw errors.
```swift
import Foundation
import Combine

struct AsyncThrowingStreamExample {
    static func createStream() -> AsyncThrowingStream<Int, Error> { // Function to create an AsyncThrowingStream of integers
        return AsyncThrowingStream { continuation in // The closure provides a continuation to yield values or throw errors
            for i in 1...5 {
                if i == 3 {
                    continuation.yield(with: .failure(NSError(domain: "TestError", code: 1, userInfo: nil)))
                } else {
                    continuation.yield(i) // Yielding values
                }
            }
            continuation.finish() // Finish the stream
        }
    }
}
```
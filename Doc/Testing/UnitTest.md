# Unit Testing in Swift

Unit testing is a crucial part of software development that helps ensure code quality and functionality. In Swift, unit tests are typically written using the XCTest framework.

## Stub and Mock

[Udemy](https://www.udemy.com/course/swift-testing-essentials-a-practical-guide/learn/lecture/48842913?start=15#overview)

Stubs and mocks are used in unit testing to isolate the code being tested from its dependencies. This allows for more controlled and predictable tests.

```swift
import Testing
@testable import OuluBankR1

// Example of a stub
struct UserServiceStub: UserService {
    func fetchUser() -> User {
        return User(name: "Test User", age: 30)
    }
}
// Example of a mock
struct UserServiceMock: UserService {
    var fetchUserCalled = false

    func fetchUser() -> User {
        fetchUserCalled = true
        return User(name: "Mock User", age: 25)
    }
}

struct Tests {
    // Example of a test using the stub and mock
    @Test("Unit Tests for UserService")
    func testUserServiceStub() {
        let userService = UserServiceStub()
        let user = userService.fetchUser()
        #expect(user.name).to(equal("Test User"))
        #expect(user.age).to(equal(30))
    }

    @Test("Unit Tests for UserService Mock")
    func testUserServiceMock() {
        let userService = UserServiceMock()
        let user = userService.fetchUser()
        #expect(user.name).to(equal("Mock User"))
        #expect(user.age).to(equal(25))
        #expect(userService.fetchUserCalled).to(beTrue())
    }
}

```

## XCTest Framework

XCTest is the default testing framework provided by Apple for writing unit tests in Swift. It allows developers to create test cases, assertions, and performance tests.

### Basic Structure of a Unit Test
```swift
import XCTest
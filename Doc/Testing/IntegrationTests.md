# Integration Tests in Swift

Focus on integration between components and systems, ensuring that they work together as expected. Integration tests are typically more complex than unit tests and may involve multiple components or services.


## Example of an Integration Test

```swift
import Testing
@testable import OuluBankR1
struct IntegrationTests {
    @Test("Integration Test for User Service and Database")
    func testUserServiceIntegration() {
        let userService = UserService()
        let database = Database()

        // Simulate saving a user to the database
        let user = User(name: "Integration User", age: 28)
        database.save(user)

        // Fetch the user from the service
        let fetchedUser = userService.fetchUser(name: "Integration User")

        // Verify that the fetched user matches the saved user
        #expect(fetchedUser.name).to(equal("Integration User"))
        #expect(fetchedUser.age).to(equal(28))
    }
}
```
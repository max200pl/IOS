# Testing in Swift

# Patterns

- Arrange, Act, Assert (AAA)
- Given, When, Then (GWT)


## AAA Pattern

```swift
@Test
func testExample() {
    // Arrange
    let expected = 42
    let sut = MyClass()

    // Act
    let result = sut.calculate()

    // Assert
    #expect(result).to(equal(expected))
}
```
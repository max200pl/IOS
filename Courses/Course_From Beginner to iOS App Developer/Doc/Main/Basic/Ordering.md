# Ordering in Swift

    In Swift, ordering refers to the arrangement or sequence of elements in a collection or data structure. Swift provides various ways to order elements, including sorting arrays, dictionaries, and sets. This document will cover the basic concepts of ordering in Swift, including sorting algorithms and methods for arranging elements in a specific order.

## Basic Ordering Concepts

1. **Arrays**: An array is an ordered collection of elements. The order of elements in an array is determined by their index, starting from 0. You can access elements in an array using their index.
   ```swift
   let numbers = [1, 2, 3, 4, 5]
   print(numbers[0]) // Output: 1
   ```
2. **Dictionaries**: A dictionary is an unordered collection of key-value pairs. The order of elements in a dictionary is not guaranteed, but you can access values using their corresponding keys.
   ```swift
   let fruits = ["apple": 1, "banana": 2, "cherry": 3]
   print(fruits["banana"]) // Output: 2
   ```
3. **Sets**: A set is an unordered collection of unique elements. The order of elements in a set is not guaranteed, and you cannot access elements using an index.
   ```swift
   let uniqueNumbers: Set = [1, 2, 3, 4, 5]
   print(uniqueNumbers.contains(3)) // Output: true
   ```
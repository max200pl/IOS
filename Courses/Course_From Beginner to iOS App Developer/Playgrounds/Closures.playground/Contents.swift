import UIKit

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

// #Use closure function

let result = calculator(n1: 10, n2: 20) { (a: Int, b: Int) -> Int in
    return a + b
}
print(result)

// #Use shorter version
let shorterResult = calculator(n1: 10, n2: 20)  { (a: Int, b: Int) in a + b }

// #Use dollar sign

let anotherResult = calculator(n1: 10, n2: 20) { $0 + $1 }

// #Use in array

let numbers: [Int] = [10, 20, 30, 40, 50]

print(numbers.map{ $0 * 2 })

print(numbers.map{"\($0)"})

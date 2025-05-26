import UIKit

var pizzaInInches: Int = 8 {
    willSet {
        print("Pizza size is about \(newValue) inches.")
    }
    
    didSet {
        if pizzaInInches < 8 {
            print( "Eat faster!")
            pizzaInInches = 8
        }
    }
}

var numberOfPeople: Int = 4
let sclicePerPerson: Int = 2

var nubmerOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
    
    set {
        print("Number of slices set to \(newValue)")
    }
}

var numberOfPizza: Int {
    get {
        let numberOfSlicesPerPizza = nubmerOfSlices / sclicePerPerson
        return numberOfPeople / numberOfSlicesPerPizza
    }
    
    set {
        let totalSlices =  numberOfPizza * newValue
        
        numberOfPeople = totalSlices * sclicePerPerson
    }
}

print("Number of pizza: \(numberOfPizza)")


var widht: Float = 1.5
var height: Float = 2.0

var bucketsOfPaint: Int {
    get {
        let area = widht * height
        
        let areaConvertedPerBucket: Float = 1.5
        
        let numberOfBuckets = area / areaConvertedPerBucket
        
        let roundedNumberOfBuckets = ceil(numberOfBuckets)
        
        return Int(numberOfBuckets)
    }
    
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("Area can cover: \(areaCanCover)")
    }
}

print("Number of bucket: \(bucketsOfPaint)")

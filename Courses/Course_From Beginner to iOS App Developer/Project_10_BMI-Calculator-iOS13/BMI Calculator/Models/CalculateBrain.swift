//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Maksym Poskannyi on 30.04.2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation

import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    var bmiResult: String = "0.0"

    func getBMIValue() -> String{
        let bmiFormatter = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFormatter
    }

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = Double(weight / (height * height))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You are underweight.", color:  UIColor.green)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You have a normal weight.", color: UIColor.blue)
        } else {
            bmi = BMI(value: bmiValue, advice: "You are overweight.", color: UIColor.red)
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice available."
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}

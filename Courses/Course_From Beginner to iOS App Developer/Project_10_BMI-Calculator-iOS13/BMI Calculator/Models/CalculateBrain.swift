//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Maksym Poskannyi on 30.04.2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation

struct CalculateBrain {
    
    var bmiResult: String = "0.0"
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / pow(height, 2)
    
        bmiResult =  String(format: "%.1f", bmi)
    }
    
    func getBMIValue() -> String {
        return bmiResult
    }
}

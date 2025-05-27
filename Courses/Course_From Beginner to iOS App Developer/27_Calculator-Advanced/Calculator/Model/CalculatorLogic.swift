//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Maksym Poskannyi on 26.05.2025.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMetchod: String)?
    
    mutating func setNumber(_ number: Double ) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n *  -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2:n)
            default:
                intermediateCalculation  = (n1: n,  calcMetchod: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1  = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMetchod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError( "Unknown operation: \(operation)")
            }
        }
        return nil
    }
}

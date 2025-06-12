//
//  BankAccount.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/13/25.
//

import Foundation

enum BankAccountError: Error {
    case invalidAmount
}

enum DepositeType {
    case check
    case cash
    case transfer
}
        
// create BankAccount class 

class BankAccount {
    var accountNumber: String = ""
    private(set) var balance: Double = 0.0
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(amount: Double, depositType: DepositeType) throws {
        let transferFreePercentage = 0.02 // 2%
        
        if amount <= 0 {
            throw BankAccountError.invalidAmount
        }
        
        switch depositType {
        case .cash, .check:
            self.balance += amount
        case .transfer:
            let fee = amount * transferFreePercentage
            
            self.balance += amount - fee
        }

    }
    
}

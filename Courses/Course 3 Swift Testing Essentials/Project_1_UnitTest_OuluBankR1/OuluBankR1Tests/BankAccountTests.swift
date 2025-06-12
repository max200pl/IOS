//
//  OuluBankR1Tests.swift
//  OuluBankR1Tests
//
//  Created by Mohammad Azam on 2/13/25.
//

import Testing
@testable import OuluBankR1

struct BankAccountTests {
    @Test(arguments: [DepositeType.check, DepositeType.cash])
    func deposit_amount_using_check_or_cash_increase_balance(_ depositType: DepositeType) {
        //Arange
        let bankAccount = BankAccount(accountNumber: "1234567890", balance: 500)
        
        //Act
        try? bankAccount.deposit(amount: 200, depositType: depositType)
        
        //Assert
        #expect(bankAccount.balance == 700)
    }

    @Test
    func depostinig_using_transfer_type_charges_fee() {
        //Arange
        let bankAccount = BankAccount(accountNumber: "1234567890", balance: 500)
        
        let depositAmount: Double = 200.0
        let expectedBalance = 696.0
        
        //Act
        try? bankAccount.deposit(amount: depositAmount, depositType: .transfer)
        
        #expect(bankAccount.balance == expectedBalance)
        
    }
    
    @Test
    func depositing_negative_amount_results_in_invalid_amount_errorr() {
        let bankAccount = BankAccount(accountNumber: "1234567890", balance: 500)
        
        //Assert
        #expect(throws: BankAccountError.invalidAmount, "Depositing negative amount did not throw an error.", performing: {
            try bankAccount.deposit(amount: -100, depositType: .check)
        })
    }
}

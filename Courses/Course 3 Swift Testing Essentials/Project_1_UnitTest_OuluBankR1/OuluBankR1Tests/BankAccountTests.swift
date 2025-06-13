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
    
    @Test
    func withdrawing_amount_decreases_balance(){
        let bankAccount = BankAccount(accountNumber: "1234567890", balance: 500)
        bankAccount.withdraw(amount: 200, withdrawType: .check)
        
        #expect(bankAccount.balance == 300)
    }
    
    @Test
    func withdrawing_with_insufficient_balance_results_in_penalty(){
        let bankAccount = BankAccount(accountNumber: "1234567890", balance: 500)
        
        bankAccount.withdraw(amount: 600, withdrawType: .check)
        
        #expect(bankAccount.balance == 490)
    }
    
    @Test
    func depositing_amount_is_added_to_transaction_history(){
        let bankAccount = BankAccount(accountNumber: "1234567890", balance: 500)
        
        try? bankAccount.deposit(amount: 10, depositType: .check)
        
        #expect(bankAccount.transactions.count == 1, "Deposit transaction not added to transaction history.")
        #expect(bankAccount.transactions[0].amount == 10, "Deposit amount not correctly recorded in transaction history.")
        #expect(bankAccount.transactions[0].transactionType == TransactionType.deposit, "Deposit transaction type not correctly recorded in transaction history.")
    }
    
    
}

//
//  CreditScoreServiceTests.swift
//  CreditScoreServiceTests
//
//  Created by Maksym Poskannyi on 15.06.2025.
//

import Testing
@testable import OuluBankR1

struct CreditScoreServiceTests {

    @Test
    func credit_score_service_returns_score_for_valid_ssn() async throws {
        // STRIPE
        let ssn = "123-45-6789" // credit score 720
        
        let creditScoreService = CreditScoreService()
        let creditScore = try await creditScoreService.getCreditScore(ssn: ssn)
        
        guard let creditScore = creditScore,
              let score = creditScore.score
        else {
            Issue.record("Failed to retrieve credit score")
            return
        }
        
        #expect(score == 720)
    }
    
    @Test
    func credit_score_service_returns_no_credit_score_for_valid_ssn() async throws {
        // STRIPE
        let ssn = "211-11-1111" // credit score nil
        
        let creditScoreService = CreditScoreService()
        let creditScore = try await creditScoreService.getCreditScore(ssn: ssn)
        
        guard let creditScore = creditScore
        else {
            Issue.record("Failed to retrieve credit score")
            return
        }
        
        #expect(creditScore.score == nil)
    }

}

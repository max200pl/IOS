//
//  APRServiceCreditScoreServiceTests.swift
//  OuluBankR1Tests
//
//  Created by Mohammad Azam on 2/15/25.
//

import Testing
@testable import OuluBankR1

struct APRServiceCreditScoreServiceTests {
    
    @Test
    func apr_service_calls_get_credit_score_on_credit_score_service() async throws {
        let validSSN = "123-45-6789"
        
        var mockCreditScoreService = MockCreditScoreService()
        
        try await confirmation("APRService did not call GetCreditScore on CreditScoreService", expectedCount: 1) { confimation in
            // you need macke sure that mockCreditScoreService.getCreditScore is fired
            
            mockCreditScoreService.onGetCreditScore = { ssn in
                // call the confirmation
                // expectation met
                confimation()
                return CreditScore(score: 500, lastUpdated: "02/15/25", reportedBy: "Expired Credit Card")
            }
            
            let appService = APRService(creditScoreService: mockCreditScoreService)
            let _ = try await appService.getAPR(ssn: validSSN)
        }
    }
    
    @Test
    func apr_service_does_not_call_get_credit_score_with_invalid_ssn() async throws {
        var mockCreditScoreService = MockCreditScoreService()
        
        await confirmation("APRService called GetCreditScore even with invalid SSN", expectedCount: 0) { confirmation in
            mockCreditScoreService.onGetCreditScore = { ssn in
                confirmation()
                
                return CreditScore(score: 500, lastUpdated: "02/15/25", reportedBy: "Expired Credit Card")
            }
            
            let aprService = APRService(creditScoreService: mockCreditScoreService)
            
            let _ = try? await aprService.getAPR(ssn: "123456789")
        }
        
    }
}

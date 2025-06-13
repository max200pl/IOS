//
//  MockCreditScoreService.swift
//  OuluBankR1Tests
//
//  Created by Maksym Poskannyi on 13.06.2025.
//

import Foundation

@testable import OuluBankR1

struct MockCreditScoreService: CreditScoreServiceProtocol {
    
    func getCreditScore(ssn: String) async throws -> CreditScore? {
        switch ssn {
            case "123-45-6789": //good credit score
                return CreditScore(score: 720, lastUpdated: "02/15/2025", reportedBy: "Experian")
            case "888-65-4321":
                return CreditScore(score: 550, lastUpdated: "01/10/2025", reportedBy: "Equifax")
            case "111-11-1111":
                return CreditScore(score: nil, lastUpdated: "01/10/2025", reportedBy: "Equifax")
            default: // no credit score
                return nil
        }
    }
}

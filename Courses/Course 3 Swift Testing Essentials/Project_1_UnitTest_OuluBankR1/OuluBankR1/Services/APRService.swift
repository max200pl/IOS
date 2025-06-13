//
//  APRService.swift
//  OuluBankR1
//
//  Created by Mohammad Azam on 2/15/25.
//

import Foundation

enum CreditScoreServiceError: LocalizedError {
    case notCreditScoreFound
    case unavailable
    
    var errorDescription: String? {
        switch self {
        case .notCreditScoreFound:
            return NSLocalizedString(
                "No credit score found",
                comment: "Error message when no credit score is found"
            )
        case .unavailable:
            return NSLocalizedString(
                "Credit score service unavailable or not applicable for the given SSN",
                comment: "Credit score service unavailable or not applicable for the given SSN"
            )
        }
    }
}

struct APRService {
    
    //third party service
    let creditScoreService: CreditScoreServiceProtocol
    
    func getAPR(ssn: String) async throws -> Double {
        guard let creditScore = try await creditScoreService.getCreditScore(ssn: ssn) else{
            throw CreditScoreServiceError.notCreditScoreFound
        }
        
        if let score = creditScore.score {
            if score > 650 {
                return Double.random(in: 1...3)
            } else {
                return Double.random(in: 6...10)
            }
        } else {
            throw CreditScoreServiceError.unavailable
        }
    }
}

//
//  OuluBankR1UITests.swift
//  OuluBankR1UITests
//
//  Created by Mohammad Azam on 2/15/25.
//

import XCTest

final class OuluBankR1UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launchArguments = ["UITest"]
        app.launch()
    }
    
    func test_user_can_calculate_apr_successfully_with_valid_ssn() {
        let ssnTextField = app.textFields["ssnTextField"]
        
        ssnTextField.tap()
        ssnTextField.typeText("123-45-6789")
        

        let caluculateAPRButton = app.buttons["calculateAPRButton"]
        caluculateAPRButton.tap()
        
        let aprText = app.staticTexts["aprText"]
        let aprTextExists = aprText.waitForExistence(timeout: 5.0)
        
        XCTAssertTrue(aprTextExists)
        XCTAssertNotEqual(aprText.label, "", "APR text should not be empty")
        
        // check if the APR is in range
    }
    
    func test_display_error_message_when_credit_score_was_not_found_for_ssn(){
        let expectedErrorMessage = "No credit score found"
        
        let ssnTextField = app.textFields["ssnTextField"]
        
        ssnTextField.tap()
        ssnTextField.typeText("211-11-1111")
        
        
        let caluculateAPRButton = app.buttons["calculateAPRButton"]
        caluculateAPRButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        let messageTextExists = messageText.waitForExistence(timeout: 5.0)
        
        XCTAssertTrue(messageTextExists, "Message text should not be empty")
        XCTAssertEqual(messageText.label, expectedErrorMessage)
        
    }
}

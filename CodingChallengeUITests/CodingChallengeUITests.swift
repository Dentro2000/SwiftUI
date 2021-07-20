//
//  CodingChallengeUITests.swift
//  CodingChallengeUITests
//
//  Created by Brady Miller on 4/7/21.
//

import XCTest

class CodingChallengeUITests: XCTestCase {
        
    var app: XCUIApplication!
        
    override func setUpWithError() throws {
         app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTappedShiftShouldOpenDetailView() throws {
        let app = XCUIApplication()
        app.launch()
        
        let shiftCell = app.cells.firstMatch
        shiftCell.tap()
        
        let detailViewTitle = app.staticTexts.firstMatch
        
        XCTAssertEqual(detailViewTitle.label, "Shift Details")
    }
    
    func testResetShouldReturnShiftsFromBeginig() throws {
       
        let resetButton = app.buttons["There no avilable shifts 🤷🏻‍♂️. Tap to reset"]
    
        if (!resetButton.exists) {
            app.swipeUp()
        }
       
        resetButton.tap()
        let date = app.staticTexts.matching(identifier: "gridHeader").firstMatch
        XCTAssertEqual(date.label, Date().formmated)
    }
}

extension Date {
    var formmated: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}

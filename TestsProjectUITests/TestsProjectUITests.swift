//
//  TestsProjectUITests.swift
//  TestsProjectUITests
//
//  Created by Гузель on 02/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest

class TestsProjectUITests: XCTestCase {

    override func setUp() {
        
        continueAfterFailure = false
        
        XCUIApplication().launch()
        
    }

    override func tearDown() {
        
    }

    func testExample() {
        
        let app = XCUIApplication()
        let searchSearchField = app.searchFields["Search"]
        
        app.tables["Empty list"].swipeDown()
        searchSearchField.tap()
        searchSearchField.typeText("Tumblr")
        app.tables.staticTexts.allElementsBoundByIndex.first?.tap()
        app.buttons["Done"].tap()
        app.buttons["Cancel"].tap()
        XCTAssertFalse(searchSearchField.isSelected)
    }
}

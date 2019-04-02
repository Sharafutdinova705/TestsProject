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
        app.tables["Empty list"].swipeDown()
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        
        let cancelButton = app.buttons["Cancel"]
        cancelButton.tap()
        
        XCTAssertFalse(searchSearchField.isSelected)
    }

}

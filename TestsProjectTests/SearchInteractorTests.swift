//
//  SearchInteractorTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SearchInteractorTests: XCTestCase {

    var searchInteractor: SearchInteractor!
    
    override func setUp() {
        searchInteractor = SearchInteractor()
    }

    override func tearDown() {
        searchInteractor = nil
    }
    
    func testInteractor1() {
        searchInteractor.dataManager = DataManagerMock()
        searchInteractor.output = SearchPresenterMock()
        searchInteractor.obtainItems()
        XCTAssertTrue(searchInteractor.settings != nil)
    }
}

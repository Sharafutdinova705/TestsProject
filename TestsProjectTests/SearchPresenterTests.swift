//
//  SearchPresenterTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SearchPresenterTests: XCTestCase {
    
    var presenter: SearchPresenter!
    var router: SearchRouterMock!

    override func setUp() {
        
        presenter = SearchPresenter()
        presenter.router = SearchRouterMock()
    }

    override func tearDown() {
        
        presenter = nil
    }

    func testShowSettings() {
        presenter.showSettings()
        XCTAssertTrue((presenter.router as! SearchRouterMock).isshowSettings)
    }
}

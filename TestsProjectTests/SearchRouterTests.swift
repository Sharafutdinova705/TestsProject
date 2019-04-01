//
//  SearchRouterTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SearchRouterTests: XCTestCase {
    
    var router: SearchRouter!

    override func setUp() {
        router = SearchRouter()
    }

    override func tearDown() {
        router = nil
    }

    func testshowSettings() {
        router.view = ViewForRouterMock()
        router.showSettings()
        XCTAssertTrue((router.view as! ViewForRouterMock).isshowDetailViewController)
    }
}

//
//  SearchTableViewControllerTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 02/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SearchTableViewControllerTests: XCTestCase {
    
    var vc: SearchTableViewController!

    override func setUp() {
        vc = SearchTableViewController()
    }

    override func tearDown() {
        vc = nil
    }

    func testshowSettings() {
        vc.output = SearchPresenterMock()
        vc.showSettings("")
        XCTAssertTrue((vc.output as! SearchPresenterMock).isshowSettings)
    }
    
    func testSearchBarTextNotEmpty() {
        vc.searchController.searchBar.text = ""
        let searchBarIsEmpty = vc.searchBarIsEmpty
        XCTAssertTrue(searchBarIsEmpty)
    }
}

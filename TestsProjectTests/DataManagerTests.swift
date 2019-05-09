//
//  DataManagerTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class DataManagerTests: XCTestCase {
    
    var dataManager: DataManagerProtocol!

    override func setUp() {
        dataManager = DataManager()
    }

    override func tearDown() {
        dataManager = nil
    }

    func testDManager() {
        let settings = SettingsModel()
        settings.kindOfDevice = AllConstants.empty
        dataManager.updateItem(item: settings)
        XCTAssertTrue(dataManager.obtainItems() != nil)
    }
    
    func testDManager2() {
        dataManager.deleteAll()
        XCTAssertTrue(dataManager.obtainItems() == nil)
    }
}

//
//  ModelSettingsTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 31/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class ModelSettingsTests: XCTestCase {

    var settings: Settings!
    
    override func setUp() {
        settings = Settings(typeOfMedia: "", countOfResult: 0, kindOfDevice: "")
    }

    override func tearDown() {
        settings = nil
    }

    func testExample() {
        
        settings = Settings(typeOfMedia: "music", countOfResult: 100, kindOfDevice: "iphone")
        XCTAssertEqual(settings.typeOfMedia, "music")
    }
}

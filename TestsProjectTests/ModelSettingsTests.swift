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
        settings = Settings(typeOfMedia: AllConstants.empty, countOfResult: 0, kindOfDevice: AllConstants.empty)
    }

    override func tearDown() {
        settings = nil
    }

    func testExample() {
        
        settings = Settings(typeOfMedia: TypeOfMedia.music, countOfResult: NumberConstants.hundred, kindOfDevice: Device.iphone.lowercased())
        XCTAssertEqual(settings.typeOfMedia, TypeOfMedia.music)
    }
}

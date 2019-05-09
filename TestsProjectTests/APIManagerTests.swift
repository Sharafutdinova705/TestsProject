//
//  APIManagerTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 02/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class APIManagerTests: XCTestCase {

    var apiManager: APIManager!
    
    override func setUp() {
        apiManager = APIManager(sessionConfiguration: URLSessionConfiguration.default)
    }

    override func tearDown() {
        apiManager = nil
    }

    func testUrl() {
        apiManager.fetchResultWith(term: "qwerty", settings: Settings(typeOfMedia: TypeOfMedia.music, countOfResult: NumberConstants.hundred, kindOfDevice: Device.iphone.lowercased())) { (result) in

            
            XCTAssertNotNil(result)
        }
    }
}

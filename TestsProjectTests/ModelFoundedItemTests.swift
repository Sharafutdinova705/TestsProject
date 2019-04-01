//
//  ModelFoundedItemTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class ModelFoundedItemTests: XCTestCase {
    
    var foundedItem: FoundedItem!
    var json: [String: AnyObject] = [:]
    var json2: [String: AnyObject] = [:]
    var json3: [String: AnyObject] = [:]
    var json4: [String: AnyObject] = [:]

    override func setUp() {
        foundedItem = FoundedItem(titleLabel: "", authorLabel: "", descriptionLabel: "", priceLabel: "", itemImageView: "", typeOfMedia: "", kindOfDevice: "", limit: 0, url: "")
        json = ["trackName":"Hello2", "artistName":"12", "description":"asas", "formattedPricet":"121", "price":"1212", "artworkUrl60":"1212", "wrapperType":"software", "trackViewUrl":"qwqwqw.com", "supportedDevices":["ipadiphone"]] as [String : AnyObject]
        json2 = ["wrapperType":"software", "supportedDevices":["ipad"]] as [String:AnyObject]
        json3 = ["wrapperType":"software", "price":"12", "supportedDevices":["iphone"]] as [String:AnyObject]
        json4 = ["":""] as [String:AnyObject]
    }

    override func tearDown() {
        foundedItem = nil
        json = [:]
    }

    func testInit() {
        foundedItem = FoundedItem(titleLabel: "Hello", authorLabel: "Hello", descriptionLabel: "Hello", priceLabel: "Hello", itemImageView: "Hello", typeOfMedia: "Hello", kindOfDevice: "Hello", limit: 0, url: "Hello.com")
        
        XCTAssertEqual(foundedItem.titleLabel, "Hello")
    }
    
    func testJsonInit() {
        foundedItem = FoundedItem(JSON: json)
        XCTAssertEqual(foundedItem.titleLabel, "Hello2")
    }
    
    func testJson2Init() {
        foundedItem = FoundedItem(JSON: json2)
        XCTAssertEqual(foundedItem.titleLabel, "")
    }
    
    func testJson3Init() {
        foundedItem = FoundedItem(JSON: json3)
        XCTAssertEqual(foundedItem.priceLabel, "12")
    }
    
    func testJson4Init() {
        foundedItem = FoundedItem(JSON: json4)
        XCTAssertEqual(foundedItem.typeOfMedia, "")
    }
}

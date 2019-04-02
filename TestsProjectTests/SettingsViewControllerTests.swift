//
//  SettingsViewControllerTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 02/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SettingsViewControllerTests: XCTestCase {
    
    var vc: SettingsViewController!

    override func setUp() {
        vc = SettingsViewController()
    }

    override func tearDown() {
        vc = nil
    }

    func testObtaining() {
        vc.output = SettingsPresenterMock()
        vc.viewDidLoad()
        XCTAssertTrue((vc.output as! SettingsPresenterMock).isobtainSettings)
    }
}

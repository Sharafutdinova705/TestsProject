//
//  SettingsInteractorTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SettingsInteractorTests: XCTestCase {
    
    var interactor: SettingsInteractor!

    override func setUp() {
        interactor = SettingsInteractor()
    }

    override func tearDown() {
        interactor = nil
    }

    func testSave() {
        interactor.dataManager = DataManagerMock()
        interactor.saveSettings(settings: Settings(typeOfMedia: "music", countOfResult: 100, kindOfDevice: "iphone"))
        XCTAssertTrue((interactor.dataManager as! DataManagerMock).isUpdated)
    }
    
    func testobtainSettings() {
        interactor.dataManager = DataManagerMock()
        interactor.output = SettingsPresenterMock()
        interactor.obtainSettings()
        XCTAssertTrue((interactor.output as! SettingsPresenterMock).isupdateSettingsInVC)
    }
    
    func testSecondobtainSettings() {
        interactor.dataManager = SecondDataManagerMock()
        interactor.output = SettingsPresenterMock()
        interactor.obtainSettings()
        XCTAssertTrue((interactor.output as! SettingsPresenterMock).isupdateSettingsInVC)
    }
}

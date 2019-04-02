//
//  SettingsPresenterTests.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import XCTest
@testable import TestsProject

class SettingsPresenterTests: XCTestCase {
    
    var presenter: SettingsPresenter!

    override func setUp() {
        presenter = SettingsPresenter()
    }

    override func tearDown() {
        presenter = nil
    }
    
    func testsaveSettings() {
        presenter.interactor = SettingsInteractorMock()
        presenter.saveSettings(settings: Settings(typeOfMedia: "music", countOfResult: 100, kindOfDevice: "iphone"))
        XCTAssertTrue((presenter.interactor as! SettingsInteractorMock).issaveSettings)
    }
    
    func testobtainSettings() {
        presenter.interactor = SettingsInteractorMock()
        presenter.obtainSettings()
        XCTAssertTrue((presenter.interactor as! SettingsInteractorMock).isobtainSettings)
    }
    
    func testupdateSettingsInVC() {
        presenter.view = ViewForSettingsInteractorMock()
        presenter.updateSettingsInVC(settings: Settings(typeOfMedia: "music", countOfResult: 100, kindOfDevice: "iphone"))
        XCTAssertTrue((presenter.view as! ViewForSettingsInteractorMock).isupdateSettingsInVC)
    }
    
}

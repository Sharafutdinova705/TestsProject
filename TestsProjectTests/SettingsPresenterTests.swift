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
        presenter.saveSettings(settings: Settings(typeOfMedia: TypeOfMedia.music, countOfResult: NumberConstants.hundred, kindOfDevice: Device.iphone.lowercased()))
        XCTAssertTrue((presenter.interactor as! SettingsInteractorMock).isSaveSettings)
    }
    
    func testobtainSettings() {
        presenter.interactor = SettingsInteractorMock()
        presenter.obtainSettings()
        XCTAssertTrue((presenter.interactor as! SettingsInteractorMock).isObtainSettings)
    }
    
    func testupdateSettingsInVC() {
        presenter.view = ViewForSettingsInteractorMock()
        presenter.updateSettingsInVC(settings: Settings(typeOfMedia: TypeOfMedia.music, countOfResult: NumberConstants.hundred, kindOfDevice: Device.iphone.lowercased()))
        XCTAssertTrue((presenter.view as! ViewForSettingsInteractorMock).isUpdateSettingsInVC)
    }
}

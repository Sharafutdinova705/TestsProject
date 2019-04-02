//
//  SettingsPresenterMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
@testable import TestsProject

class SettingsPresenterMock: SettingsInteractorOutput, SettingsViewOutput {

    var isupdateSettingsInVC = false
    var issaveSettings = false
    var isobtainSettings = false
    
    func updateSettingsInVC(settings: Settings) {
        isupdateSettingsInVC = true
    }
    
    func saveSettings(settings: Settings) {
        issaveSettings = true
    }
    
    func obtainSettings() {
        isobtainSettings  = true
    }
}


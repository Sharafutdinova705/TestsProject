//
//  SettingsInteractorMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
@testable import TestsProject

class SettingsInteractorMock: SettingsInteractorInput {
    
    var isSaveSettings = false
    var isObtainSettings = false
    
    func saveSettings(settings: Settings) {
        isSaveSettings = true
    }
    
    func obtainSettings() {
        isObtainSettings = true
    }
}

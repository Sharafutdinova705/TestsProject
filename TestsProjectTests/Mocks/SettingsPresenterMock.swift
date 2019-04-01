//
//  SettingsPresenterMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
@testable import TestsProject

class SettingsPresenterMock: SettingsInteractorOutput {
    
    var isupdateSettingsInVC = false
    
    func updateSettingsInVC(settings: Settings) {
        isupdateSettingsInVC = true
    }
}


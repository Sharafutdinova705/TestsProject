//
//  ViewForSettingsInteractorMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit
@testable import TestsProject

class ViewForSettingsInteractorMock: UIViewController, SettingsViewInput {
    
    var isUpdateSettingsInVC = false
    
    func updateSettingsInVC(settings: Settings) {
        isUpdateSettingsInVC = true
    }
}

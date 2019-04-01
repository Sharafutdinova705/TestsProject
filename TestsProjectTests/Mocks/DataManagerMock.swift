//
//  DataManagerMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift
@testable import TestsProject

class DataManagerMock: DataManagerProtocol {
    
    var isUpdated = false
    var isDeleted = false
    
    func updateItem(item: Object) {
        isUpdated = true
    }
    
    func obtainItems() -> SettingsModel? {
        let settings = SettingsModel()
        settings.id = 0
        settings.countOfResult = 100
        settings.kindOfDevice = "ipad"
        settings.typeOfMedia = "music"
        return settings
    }
    
    func deleteAll() {
        isDeleted = true
    }
    
    
}

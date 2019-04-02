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

class SecondDataManagerMock: DataManagerProtocol {
    
    var isUpdated = false
    var isDeleted = false
    
    func updateItem(item: Object) {
        isUpdated = true
    }
    
    func obtainItems() -> SettingsModel? {
        return nil
    }
    
    func deleteAll() {
        isDeleted = true
    }
}

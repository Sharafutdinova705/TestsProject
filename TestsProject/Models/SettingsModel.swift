//
//  SettingsModel.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class SettingsModel: Object {
    
    dynamic var id = 0
    dynamic var typeOfMedia = String()
    dynamic var countOfResult = Int()
    dynamic var kindOfDevice = String()
    
    override static func primaryKey() -> String? {
        return #keyPath(id)
    }
}


//
//  Settings.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class Settings {
    
    var typeOfMedia = String()
    var countOfResult = Int()
    var kindOfDevice = String()
    
    init(typeOfMedia: String, countOfResult: Int, kindOfDevice: String) {
        
        self.typeOfMedia = typeOfMedia
        self.countOfResult = countOfResult
        self.kindOfDevice = kindOfDevice
    }
}

//
//  SearchInteractor.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class SearchInteractor: SearchInteractorInput {
    
    var output: SearchInteractorOutput!
    var dataManager: DataManagerProtocol!
    var settings: Settings!
    
    func obtainItems() {
        
        if let settingsModel = dataManager.obtainItems() {
            
            settings = Settings(typeOfMedia: settingsModel.typeOfMedia, countOfResult: settingsModel.countOfResult, kindOfDevice: settingsModel.kindOfDevice)
            output.updateSettings(settings: settings)
        } else {
            settings = Settings(typeOfMedia: TypeOfMedia.music, countOfResult: NumberConstants.hundred, kindOfDevice: Device.iphone.lowercased())
            output.updateSettings(settings: settings)
        }
    }
}

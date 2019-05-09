//
//  SettingsInteractor.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class SettingsInteractor: SettingsInteractorInput {
    
    var output: SettingsInteractorOutput!
    var dataManager: DataManagerProtocol!
    
    func saveSettings(settings: Settings) {
        
        let settingsModel = SettingsModel()
        settingsModel.typeOfMedia = settings.typeOfMedia
        settingsModel.countOfResult = settings.countOfResult
        settingsModel.kindOfDevice = settings.kindOfDevice
        
        dataManager.updateItem(item: settingsModel)
    }
    

    
    func obtainSettings() {
        
        var settings: Settings
        
        if let settingsModel = dataManager.obtainItems() {

            settings = Settings(typeOfMedia: settingsModel.typeOfMedia, countOfResult: settingsModel.countOfResult, kindOfDevice: settingsModel.kindOfDevice)
        } else {
            settings = Settings(typeOfMedia: TypeOfMedia.music, countOfResult: NumberConstants.hundred, kindOfDevice: Device.iphone.lowercased())
        }
        
        output.updateSettingsInVC(settings: settings)
    }
}

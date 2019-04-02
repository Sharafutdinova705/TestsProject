//
//  SettingsPresenter.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsViewOutput, SettingsInteractorOutput {
    
    var view: SettingsViewInput!
    var interactor: SettingsInteractorInput!
    
    //MARK: - SettingsViewOutput
    
    func saveSettings(settings: Settings) {
        interactor.saveSettings(settings: settings)
    }
    
    func obtainSettings() {
        interactor.obtainSettings()
    }
    
    func updateSettingsInVC(settings: Settings) {
        view.updateSettingsInVC(settings: settings)
    }
}

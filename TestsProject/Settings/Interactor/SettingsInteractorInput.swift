//
//  SettingsInteractorInput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SettingsInteractorInput: AnyObject {
    
    /// сохранить/обновить настройки в бд
    ///
    /// - Parameter settings: настройки
    func saveSettings(settings: Settings)
    
    /// получить настройки из бд
    func obtainSettings()
}

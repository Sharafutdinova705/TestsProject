//
//  SettingsViewOutput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SettingsViewOutput: AnyObject {
    
    /// Сохранение настроек в бд
    ///
    /// - Parameter settings: настройки
    func saveSettings(settings: Settings)
    
    /// получение настроек
    func obtainSettings()
}

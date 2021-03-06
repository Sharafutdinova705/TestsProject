//
//  SettingsInteractorOutput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SettingsInteractorOutput: AnyObject {
    
    /// обновить настройки во вью контроллере
    ///
    /// - Parameter settings: настройи
    func updateSettingsInVC(settings: Settings)
}

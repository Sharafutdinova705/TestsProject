//
//  SettingsViewInput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SettingsViewInput: AnyObject {
    
    /// Обновление настроек во вьюконтроллере
    ///
    /// - Parameter settings: <#settings description#>
    func updateSettingsInVC(settings: Settings)
}

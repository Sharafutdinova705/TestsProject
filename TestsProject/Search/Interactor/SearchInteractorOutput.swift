//
//  SearchInteractorOutput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SearchInteractorOutput: AnyObject {
    
    /// Сохранить/ обновить настройки
    ///
    /// - Parameter settings: настройки
    func updateSettings(settings: Settings)
}

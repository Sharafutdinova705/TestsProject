//
//  SearchViewOutput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SearchViewOutput: AnyObject {
    
    /// Показать настройки
    func showSettings()
    
    /// Получить настройки
    func obtainItems()
}

//
//  SearchViewInput.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol SearchViewInput: AnyObject {
    
    /// обновление настроек
    ///
    /// - Parameter settings: настройки
    func updateSettings(_ settings: Settings)
}

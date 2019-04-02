//
//  DataManagerProtocol.swift
//  HWPushN
//
//  Created by Гузель on 24/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataManagerProtocol: AnyObject {
    
    /// Сохранить модель в Realm, обновить при изменении
    ///
    /// - Parameter item: получает модель, которую надо сохранить/обновить
    /// - Returns: -
    func updateItem(item: Object)
    
    /// ПОлучить все SettingModels
    ///
    /// - Returns: первый элемент массива, если есть
    func obtainItems() -> SettingsModel?

    /// Удаляет все модели из бд
    func deleteAll()
}

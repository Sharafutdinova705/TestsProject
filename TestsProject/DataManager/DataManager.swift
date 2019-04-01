//
//  DataManager.swift
//  HWPushN
//
//  Created by Гузель on 24/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift

class DataManager: DataManagerProtocol {
    
    fileprivate lazy var mainRealm: Realm = try! Realm(configuration: .defaultConfiguration)
    
    /// Сохранить модель в Realm, обновить при изменении
    ///
    /// - Parameter item: модель, которую нужно сохранить
    func updateItem(item: Object) {
        
        try! mainRealm.write {
            mainRealm.add(item, update: true)
        }
    }
    
    func obtainItems() -> SettingsModel? {
        
        var array: [SettingsModel]? = []
        
        try! mainRealm.write {
            array = Array(mainRealm.objects(SettingsModel.self))
        }
        
        return array?.first
    }
    
    func deleteAll() {
        try! mainRealm.write {
            mainRealm.deleteAll()
        }
    }
}

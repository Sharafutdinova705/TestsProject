//
//  SearchPresenterMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
@testable import TestsProject

class SearchPresenterMock: SearchViewOutput, SearchInteractorOutput {
    
    var isshowSettings = false
    var isobtainItems = false
    var isupdateSettings = false
    
    func showSettings() {
        isshowSettings = true
    }
    
    func obtainItems() {
        isobtainItems = true
    }
    
    func updateSettings(settings: Settings) {
        isupdateSettings = true
    }
    
}

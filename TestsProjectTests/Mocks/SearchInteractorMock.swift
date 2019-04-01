//
//  SearchInteractorMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
@testable import TestsProject

class SearchInteractorMock: SearchInteractorInput {
    
    var isobtained = false
    
    func obtainItems() {
        isobtained = true
    }
}

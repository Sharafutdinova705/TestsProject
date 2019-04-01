//
//  SearchPresenter.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class SearchPresenter: SearchViewOutput, SearchInteractorOutput {
    
    weak var view: SearchViewInput!
    var router: SearchRouterInput!
    var interactor: SearchInteractorInput!
    
    //MARK: - SearchViewOutput
    
    func showSettings() {
        router.showSettings()
    }
    
    func obtainItems() {
        interactor.obtainItems()
    }
    
    func updateSettings(settings: Settings) {
        view.updateSettings(settings: settings)
    }
}

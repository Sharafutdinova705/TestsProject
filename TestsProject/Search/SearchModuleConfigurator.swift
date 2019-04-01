//
//  SearchModuleConfigurator.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class SearchModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! SearchTableViewController
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let dataManager = DataManager()
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.dataManager = dataManager
        interactor.output = presenter
        router.view = viewController
    }
}

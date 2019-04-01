//
//  SettingsModuleConfigurator.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class SettingsModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! SettingsViewController
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let dataManager = DataManager()
        
        viewController.output = presenter
        interactor.dataManager = dataManager
        interactor.output = presenter
        presenter.view = viewController
        presenter.interactor = interactor
    }
}

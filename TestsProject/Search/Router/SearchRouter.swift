//
//  SearchRouter.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class SearchRouter: SearchRouterInput {
    
    var view: UIViewController!
    
    func showSettings() {
        
        let mainStoryboard = UIStoryboard(name: AllConstants.main, bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: AllConstants.settings) as! SettingsViewController
        
        view.showDetailViewController(vc, sender: nil)
    }
}

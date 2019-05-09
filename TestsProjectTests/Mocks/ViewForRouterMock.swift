//
//  ViewForRouterMock.swift
//  TestsProjectTests
//
//  Created by Гузель on 01/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit
@testable import TestsProject

class ViewForRouterMock: UIViewController {

    var isShowDetailViewController = false
    
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        isShowDetailViewController = true
    }

}

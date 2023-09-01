//
//  CustomTabViewController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = UIColor(named: "darkGray")
        
        tabBar.barTintColor = UIColor(named: "darkGray")
        
        tabBar.tintColor = UIColor(named: "yellow")
    }
}

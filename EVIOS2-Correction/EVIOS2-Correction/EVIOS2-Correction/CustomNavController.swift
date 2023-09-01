//
//  CustomNavController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "darkGray")!
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yellow")!]
        navigationBar.compactAppearance = appearance
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.tintColor = UIColor(named: "yellow")!
    
        }
    }

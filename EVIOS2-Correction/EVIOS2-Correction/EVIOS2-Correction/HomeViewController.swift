//
//  ViewController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Navigation vers login modal
    
    @IBAction func openFacebookLogin(_ sender: Any) {
        openModal(connexionType: "facebook")
    }
    
    @IBAction func openGoogleLogin(_ sender: Any) {
        openModal(connexionType: "google")
    }
    
    
    func openModal(connexionType: String) {
        //instanciation de la viewController de destination
        if let loginViewController = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController {
            
            //type de modal
            loginViewController.modalPresentationStyle = .fullScreen
            
            //passage de données
            loginViewController.loginType = connexionType
            
            //navigation vers la modal
            present(loginViewController, animated: true, completion:
                        nil)
        }
    }
}


//
//  LoginViewController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var loginImage: UIImageView!
    
    //var permettant le passage de données
    var loginType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gestion de la fermeture du clavier
        let tapOnView = UITapGestureRecognizer(target: view, action:
                                                #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
        
        //changement de l'image en fonction de la donnée reçue
        if (loginType == "facebook") {
            loginImage.image = UIImage(named: "faceook_header")
        } else {
            loginImage.image = UIImage(named: "google_header")
        }
    }
    
    @IBAction func closeModal(_ sender: Any) {
        //fermeture de la modal
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Login verifiaction
    @IBAction func loginTap(_ sender: Any) {
        guard let login = loginField.text,
              let password = passwordField.text else {
            return
        }
        
        //gesntion des erreurs
        guard !login.isEmpty else {
            errorAlertMessage(message: "Le login est vide.")
            return
        }
        
        guard login.contains("@") else {
            errorAlertMessage(message: "Le login doit contenir '@'.")
            return
        }
        
        guard !password.isEmpty else {
            errorAlertMessage(message: "Le mot de passe est vide")
            return
        }
        
        //navigation
        if let tabBarController = storyboard?.instantiateViewController(identifier: "CustomTabbarController") {
            tabBarController.modalPresentationStyle = .fullScreen
            present(tabBarController, animated: true, completion: nil)
        }
        
        func errorAlertMessage(message: String) {
            let alert = UIAlertController(title: "ERROR", message: message, preferredStyle:
                    .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(alert, animated: true, completion: nil)
        }
    }
}

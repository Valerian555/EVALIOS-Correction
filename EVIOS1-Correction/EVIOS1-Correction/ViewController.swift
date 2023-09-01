//
//  ViewController.swift
//  EVIOS1-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordSwitch: UIButton!
    @IBOutlet weak var newsletterSwitch: UISwitch!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var loginLoader: UIActivityIndicatorView!
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //arrondie de l'avatar
        avatarImage.layer.cornerRadius = (view.frame.width * 0.4) / 2
        avatarImage.clipsToBounds = true
        
        //arrondie du bouton
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        //switch par défaut
        newsletterSwitch.isOn = false
        
        //loader par défaut
        loginLoader.isHidden = true
        
        //setup du mot de passe et du login textfield
        passwordTextField.isSecureTextEntry = true
        loginTextField.keyboardType = .emailAddress
        
        //gestion de la fermeture du clavier
        let tapOnView = UITapGestureRecognizer(target: view, action:
                                                #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
    }
    
    //changement de l'image en fonction de l'affichage du password
    @IBAction func passwordSwitch(_ sender: Any) {
        //toogle permet le changement d'un boolean
        passwordTextField.isSecureTextEntry.toggle()
        
        let imageName = passwordTextField.isSecureTextEntry ? "eye_on_icon" : "eye_off_icon"
        passwordSwitch.setImage(UIImage(named: imageName), for: .normal)
    }
    
    //MARK: Login vérification
    @IBAction func loginTap(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text
        else {
            return
        }
        
        guard !login.isEmpty else {
            errorAlertMessage(message: "Le login est vide.")
            return
        }
        
        guard !password.isEmpty else {
            errorAlertMessage(message: "Le mot de passe est vide.")
            return
        }
        
        guard login.contains("@") else {
            errorAlertMessage(message: "Le format du login n'est pas correcte.")
            return
        }
        
        guard password.count >= 4 else {
            errorAlertMessage(message: "Le mot de passe doit au moins contenir 4 caractères")
            return
        }
        
        //lancement du loader
        loginLoader.isHidden = false
        loginLoader.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.loginLoader.isHidden = true
            successAlertMessage()
        }
        
        func errorAlertMessage(message: String) {
            let alert = UIAlertController(title: "ERROR", message: message, preferredStyle:
                    .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(alert, animated: true, completion: nil)
        }
        
        func successAlertMessage() {
            let alert = UIAlertController(title: "Bienvenue \(login)!", message: newsletterSwitch.isOn ? "Vous vous êtes inscrit à la newsletter." : "Vous ne vous êtes pas inscrit à la newsletter.", preferredStyle:
                    .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(alert, animated: true, completion: nil)
        }
    }
}


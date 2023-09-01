//
//  PickerViewController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit
import SafariServices

class PickerViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonPicker: UIPickerView!
    
    //récupération du lien externalisé
    let pokemonUrl = NSLocalizedString("pokemon_url", comment:"")
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nom de la navbar
        self.title = "Picker"
        
        pokemonPicker.dataSource = self
        pokemonPicker.delegate = self
    }
    
    //ouvrir lien safari
    @IBAction func openSafariView(_ sender: Any) {
        if let url = URL(string: pokemonUrl )
        {
            let vc = SFSafariViewController (url: url)
            present(vc, animated: true)
        }
    }
}

//MARK: Picker extension

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //nombre de colonnes
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    //nombre d'éléments par colonne
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pokemonList.count
        } else {
            return colorList.count
        }
    }
    
    //nom des éléments
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pokemonList[row].name
        } else {
            return colorList[row].name
        }
    }
    
    //action lorsque l'on selectionne un élément
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pokemonImage.image = UIImage(named: pokemonList[row].imageName)
        } else {
            colorView.backgroundColor = colorList[row].color
        }
    }
}

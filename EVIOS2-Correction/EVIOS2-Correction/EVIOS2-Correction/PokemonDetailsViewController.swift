//
//  PokemonDetailsViewController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    //var permettant le passage de données
    var pokemon: Pokemon?

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonGen: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonNumber.text = pokemon?.pokedexNumber.formatted()
        pokemonName.text = pokemon?.name
        pokemonType.text = pokemon?.type.rawValue
        pokemonHeight.text = pokemon?.height.formatted()
        pokemonGen.text = pokemon?.generation.formatted()
        pokemonImage.image = UIImage(named: pokemon!.imageName)
    }
}

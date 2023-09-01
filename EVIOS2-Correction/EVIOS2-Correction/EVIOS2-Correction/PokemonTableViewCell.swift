//
//  PokemonTableViewCell.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(pokemon: Pokemon) {
        pokemonName.text = pokemon.name
        pokemonImage.image = UIImage(named: pokemon.imageName)
    }
}

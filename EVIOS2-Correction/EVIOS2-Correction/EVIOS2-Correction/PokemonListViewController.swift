//
//  PokemonListViewController.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var pokemonTableView: UITableView!
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titre de la navBar
        self.title = "Pokemon"
        
        //gestion de la tableView
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "PokemonTableViewCell")
    }
}

//MARK: TableView extension

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //nombre de cellule
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonList.count
    }
    
    
    //Setup de l'UI de la cellule
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier:
                                                        "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        
        customCell.setup(pokemon: pokemonList[indexPath.row])
        
        return customCell
    }
    
    //réagir au tap sur la cellule
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //instancier le ViewController de destination
        let pokemonDetailsViewController = storyboard?.instantiateViewController(identifier: "PokemonDetailsViewController") as! PokemonDetailsViewController
        
        //passage de données
        pokemonDetailsViewController.pokemon = pokemonList[indexPath.row]
        
        //méthode permettant la navigation
        navigationController?.pushViewController(pokemonDetailsViewController, animated: true)
    }
}

//
//  PokemonModel.swift
//  EVIOS2-Correction
//
//  Created by Student08 on 31/08/2023.
//

import Foundation
import UIKit

struct Pokemon {
    var name: String
    var type: PokemonType
    var imageName: String
    var generation: Int
    var pokedexNumber: Int
    var height: Float
}

enum PokemonType: String {
    case water = "Water"
    case fire = "Fire"
    case grass = "Grass"
    case flying = "Flying"
    case dragon = "Dragon"
    case poison = "Poison"
}

let pokemonList = [Pokemon(name: "Bulbizarre", type: .grass, imageName: "Bulbizarre", generation: 1, pokedexNumber: 1, height: 0.7), Pokemon(name: "Herbizarre", type: .grass, imageName: "Herbizarre", generation: 1, pokedexNumber: 2, height: 1.0), Pokemon(name: "Florizarre", type: .grass, imageName: "Florizarre", generation: 1, pokedexNumber: 3, height: 2.0), Pokemon(name: "Salameche", type: .fire, imageName: "Salameche", generation: 1, pokedexNumber: 4, height: 0.6),Pokemon(name: "Reptincel", type: .fire, imageName: "Reptincel", generation: 1, pokedexNumber: 5, height: 1.1),Pokemon(name: "Dracaufeu", type: .fire, imageName: "Dracaufeu", generation: 1, pokedexNumber: 6, height: 1.7),Pokemon(name: "Carapuce", type: .fire, imageName: "Carapuce", generation: 1, pokedexNumber: 7, height: 0.5)]


struct Color {
    var name: String
    var color: UIColor
}

let colorList = [Color(name: "Blue", color: .blue), Color(name: "Red", color: .red),Color(name: "Orange", color: .orange),Color(name: "White", color: .white),Color(name: "Green", color: .green),]

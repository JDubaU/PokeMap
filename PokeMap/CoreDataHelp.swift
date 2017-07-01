//
//  CoreDataHelp.swift
//  PokeMap
//
//  Created by Jake Wojtas on 6/30/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func addAllPokemon() {
    
    let pokemonNames = ["bellsprout", "bullbasaur", "caterpie", "charmander", "dratini", "eevee", "mankey", "meowth", "mew", "pidgey", "pikachu", "psyduck", "rattata", "snorlax", "squirtle", "venonat", "weedle", "zubat"]
    
    for pokemon in pokemonNames {
        let name = pokemon
        createPokemon(name: name, imageName: name)
    }
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createPokemon(name : String, imageName : String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
}

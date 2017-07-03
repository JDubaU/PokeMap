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


let pokemonNames : [String] = ["bellsprout", "bullbasaur", "caterpie", "charmander", "dratini", "eevee", "mankey", "meowth", "mew", "pidgey", "pikachu", "psyduck", "rattata", "snorlax", "squirtle", "venonat", "weedle", "zubat"]

func addAllPokemon() {
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

func getPokemon() -> [String] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
    let pokemonArray = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemonArray.count == 0 {
            addAllPokemon()
            return getPokemon()
        }
        
    } catch {}
    
    
    return []
}

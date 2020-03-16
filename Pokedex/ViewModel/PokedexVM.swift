//
//  PokedexVM.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation

class PokedexVM  {
    
    private let http = HttpManager.shareInstance
    private var pokedex: Pokedex?
    private var pokemonCount = 0
    var handleDataLoadComplete: (()->())?
    var allPokemons: [Pokemon] = []
    var pokemons: [Pokemon] = []
    
    
    struct Constants {
        static let base = "\(HttpManager.Constant.baseUrl)/pokemon"
    }
    
    func loadPokedexData(isFirstRequest: Bool? = true) {
        let url = isFirstRequest ?? false ? Constants.base : pokedex?.next ?? ""
        
        http.getAllPokedexInfo(from: url) { pokedex in
            self.pokedex = pokedex
            self.pokemonCount += pokedex.results.count
            self.getAllPokemonsInfo()
        }
    }
    
    private func getAllPokemonsInfo() {
        guard let results = pokedex?.results else {return}
        for (_, item) in results.enumerated() {
            http.getPokemonInfo(from: item.url) { pokemon in
                self.allPokemons.append(pokemon)
                if self.pokemonCount == self.allPokemons.count {
                    self.pokemons = self.allPokemons
                    self.handleDataLoadComplete?()
                }
            }
        }
    }
    
    func filterPokedexInfo(search text: String) {
        allPokemons.removeAll()
        if text.isEmpty {
            allPokemons = pokemons
            handleDataLoadComplete?()
            return
        }
        allPokemons = pokemons.filter{$0.name.contains(text)}
        handleDataLoadComplete?()
    }
}

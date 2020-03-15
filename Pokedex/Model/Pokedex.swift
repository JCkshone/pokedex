//
//  Pokemon.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonInfo]
    
    enum CondingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

struct PokemonInfo: Decodable {
    let pokemonName: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case pokemonName = "name"
        case url
    }
}

struct PokedexItem: Decodable {
    let sprites: Sprite
    let name: String
    let cost: Int
    enum CodingKeys: String, CodingKey {
        case sprites
        case name
        case cost
    }
}

struct Sprite: Decodable {
    let imgUrl: String
    enum CodingKeys: String, CodingKey {
        case imgUrl = "default"
    }
}

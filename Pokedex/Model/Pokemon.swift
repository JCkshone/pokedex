//
//  Pokemon.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let types: [PokemonType]
    let stats: [PokemonStat]
    let abilities: [PokemonAbilities]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case stats
        case abilities
    }
}

struct PokemonType: Decodable {
    let slot: Int
    let type: Type
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

struct Type: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey   {
        case name
        case url
    }
}

struct PokemonMove: Decodable {
    let name: String
    let type: Type
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
    }
}

struct PokemonStat: Decodable {
    let stat: Type
    let base_stat: Int
    
    enum CondingKeys: String, CodingKey {
        case stat
        case base_stat
    }
}

struct PokemonAbilities: Decodable {
    let ability: Type
    let isHidden: Bool
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
    }
}

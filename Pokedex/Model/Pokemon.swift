//
//  Pokemon.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let types: [PokemonType]
    let stats: [PokemonStat]
    
    enum CodingKeys: String, CodingKey {
        case name
        case types
        case stats
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
    let baseStat: Int
    let stat: Type
    
    enum CondingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
    
}

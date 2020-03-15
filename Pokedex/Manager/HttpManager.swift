//
//  HttpManager.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation
import Alamofire

class HttpManager {
    static var shareInstance: HttpManager {
        HttpManager()
    }
    
    struct Constant {
        static let imagePath = "https://pokeres.bastionbot.org/images/pokemon/"
        static let imageExtension = ".png"
        static let baseUrl = "https://pokeapi.co/api/v2"
        static let baseUrlPokemon = "https://pokeapi.glitch.me/v1"
    }
    enum httpResponse {
        case done
        case error
    }
    
    func getImagePokemon(of pokemonIndex: Int) -> String {
        "\(Constant.imagePath)\(pokemonIndex)\(Constant.imageExtension)"
    }
    
    func getAllPokedexInfo(from url: String,handledResponse: @escaping (_ data: Pokedex)->()) {
        let request = AF.request(url)
        request.responseDecodable(of: Pokedex.self) { response in
            guard let data = response.value else {return}
            handledResponse(data)
        }
    }
    
    func getPokemonInfo(from url: String, handledResponse: @escaping (_ data: Pokemon)->()) {
        let request = AF.request(url)
        request.responseDecodable(of: Pokemon.self) { response in
            guard let data = response.value else {return}
            handledResponse(data)
        }
    }
    
    func getPokedexItemInfo(from url: String, handledResponse: @escaping (_ data: PokedexItem)->()) {
        let request = AF.request(url)
        request.responseDecodable(of: PokedexItem.self) { response in
            guard let data = response.value else {return}
            handledResponse(data)
        }
    }
    
    func getPokemonMove(from url: String, handledResponse: @escaping (_ data: PokemonMove)->()) {
        let request = AF.request(url)
        request.responseDecodable(of: PokemonMove.self) { response in
            guard let data = response.value else {return}
            handledResponse(data)
        }
    }
}

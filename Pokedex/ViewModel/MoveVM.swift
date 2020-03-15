//
//  MoveVM.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation

class MoveVM {
    private let http = HttpManager.shareInstance
    private var pokedex: Pokedex?
    private var itemsCount = 0
    var handleDataLoadComplete: (()->())?
    var items: [PokemonMove] = []
    
    struct Constants {
        static let base = "\(HttpManager.Constant.baseUrl)/move"
    }
    
    func loadPokedexData(isFirstRequest: Bool? = true) {
        let url = isFirstRequest ?? false ? Constants.base : pokedex?.next ?? ""
        
        http.getAllPokedexInfo(from: url) { pokedex in
            self.pokedex = pokedex
            self.itemsCount += pokedex.results.count
            self.getAllPokedexItems()
        }
    }
    
    private func getAllPokedexItems() {
        guard let results = pokedex?.results else {return}
        for (_, item) in results.enumerated() {
            print(item.url)
            http.getPokemonMove(from: item.url) { response in
                self.items.append(response)
                if self.itemsCount == self.items.count {
                    self.handleDataLoadComplete?()
                }
            }
        }
    }
}

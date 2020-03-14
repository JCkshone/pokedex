//
//  ItemVM.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation

class ItemVM {
    private let http = HttpManager.shareInstance
    private var pokedex: Pokedex?
    private var itemsCount = 0
    var handleDataLoadComplete: (()->())?
    var items: [PokedexItem] = []
    
    struct Constants {
        static let base = "\(HttpManager.Constant.baseUrl)/item"
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
            http.getPokedexItemInfo(from: item.url) { response in
                self.items.append(response)
                if self.itemsCount == self.items.count {
                    self.handleDataLoadComplete?()
                }
            }
        }
    }
}

//
//  PokemonAbilitiesTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 16/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class PokemonAbilitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var varabilities: [PokemonAbilities] = [] {
        didSet {
//            tableView.dataSource = self
//            tableView.delegate = self
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

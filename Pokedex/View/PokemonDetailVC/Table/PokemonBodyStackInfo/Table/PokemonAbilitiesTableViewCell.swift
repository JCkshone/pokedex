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
    
    struct Constants {
        static let cellId = "AbilityItemTableViewCell"
    }
    
    var abilities: [PokemonAbilities] = [] {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
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

extension PokemonAbilitiesTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(Constants.cellId, owner: self, options: nil)?.first as! AbilityItemTableViewCell
        return cell
    }
    
    
}

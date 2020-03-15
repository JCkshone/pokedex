//
//  PokemonInfoTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class PokemonInfoTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var pokemonName: UILabel!
    @IBOutlet fileprivate weak var pokemonDescription: UILabel!
    @IBOutlet weak var firstType: UIButton!
    @IBOutlet weak var secondType: UIButton!
    @IBOutlet weak var firstBtnConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondBtnConstraint: NSLayoutConstraint!
    
    var name: String = "" {
        didSet {
            pokemonName.text = name.capitalized
        }
    }
    
    var itemDescription: String = "" {
        didSet {
            pokemonDescription.text = itemDescription
        }
    }
    
    var types: [PokemonType] = [] {
        didSet {
            setTypes()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTypes() {
        for (key, item) in types.enumerated() {
            switch key {
            case 0:
                firstType.setBackgroundImage(UIImage(named: "ic_tag_\(item.type.name)"), for: .normal)
                firstType.isHidden = false
            default:
                secondType.setBackgroundImage(UIImage(named: "ic_tag_\(item.type.name)"), for: .normal)
                secondType.isHidden = false
            }
        }
        
        if types.count > 1  {
            firstBtnConstraint.constant = 70
            secondBtnConstraint.constant = -70
        }
    }
}

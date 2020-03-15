//
//  PokemonStackInfoTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

struct ActionCollection {
    let title: String
    var active: Bool
    let action: UIButton
}

class PokemonStackInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    
    let options = ["STATS", "EVOLUTIONS", "MOVES"]
    let btnColor = #colorLiteral(red: 0.3333333333, green: 0.6235294118, blue: 0.8745098039, alpha: 1)
    private var actions: [ActionCollection] = []
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButtons()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupButtons() {
        
        for (key, title) in options.enumerated() {
            let button = UIButton().setupMenuButton(textColor: btnColor, title: title)
            button.tag = key
            actions.append(ActionCollection(title: title, active: false, action: button))
            button.addTarget(self, action: #selector(actionCliked), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        actions[0].action.setActive(color: btnColor, radius: 23)
        self.layoutIfNeeded()
    }
    
    @objc func actionCliked(sender: UIButton) {
        for key in 0..<actions.count {
            actions[key].action.setDesabled(textColor: btnColor)
        }
        UIView.animate(withDuration: 0.3) {
            self.actions[sender.tag].action.setActive(color: self.btnColor, radius: 23)
            self.actions[sender.tag].active =  !self.actions[sender.tag].active
        }
    }
}

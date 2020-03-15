//
//  MoveItemTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class MoveItemTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var itemName: UILabel!
    @IBOutlet fileprivate weak var moveBtn: UIButton!
    
    
    var name: String = "" {
        didSet {
            itemName.text = name.replacingOccurrences(of: "-", with: " ").capitalized
        }
    }
    
    var moveIcon: String = "" {
        didSet {
            guard let image = UIImage(named: "ic_\(moveIcon)") else { return }
            moveBtn.setBackgroundImage(image, for: .normal)
        }
    }
    
    func resetCell() {
        itemName.text = ""
        moveBtn.setBackgroundImage(UIImage(), for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ItemTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit
import Kingfisher

class ItemTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var currencyItem: UILabel!
    
    var itemImgUrl: String = "" {
        didSet {
            guard let url = URL(string: itemImgUrl) else { return }
            let resource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
            itemImage.kf.setImage(with: resource, placeholder: nil, options: [.transition(.fade(0.2))], progressBlock: nil) { result in
                switch result{
                case .success(let value):
                    self.itemImage.image = value.image
                case .failure(let error):
                    print("Error : \(error)")
                }
            }
        }
    }
    
    var currency: Int = 0 {
        didSet {
            currencyItem.text = "\(currency)"
        }
    }
    
    var name: String = "" {
        didSet {
            itemName.text = name.replacingOccurrences(of: "-", with: " ").capitalized
        }
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

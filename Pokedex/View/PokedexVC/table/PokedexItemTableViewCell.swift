//
//  PokedexItemTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit
import Kingfisher

class PokedexItemTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var pokemonName: UILabel!
    @IBOutlet fileprivate weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    
    var name: String = "" {
        didSet {
            pokemonName.text = name.capitalized
        }
    }
    
    var pokemonNumber: Int = 0 {
        didSet {
            pokemonId.text = buildPokemonNumber(pokemonNumber)
        }
    }
    
    var types: [PokemonType] = [] {
        didSet {
            for (key, item) in types.enumerated() {
                switch key {
                case 1:
                    firstBtn.isHidden = false
                    firstBtn.setBackgroundImage(UIImage(named: "ic_\(item.type.name.lowercased())"), for: .normal)
                default:
                    secondBtn.isHidden = false
                    secondBtn.setBackgroundImage(UIImage(named: "ic_\(item.type.name.lowercased())"), for: .normal)
                }
            }
        }
    }
    
    var pokemonImgUrl: String = "" {
        didSet {
            guard let url = URL(string: pokemonImgUrl) else {
                return
            }
            let resource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
            pokemonImg.kf.setImage(with: resource, placeholder: nil, options: [.transition(.fade(0.2))], progressBlock: nil) { result in
                switch result{
                case .success(let value):
                    self.pokemonImg.image = value.image
                case .failure(let error):
                    print("Error : \(error)")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.contentView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.7)
            self.pokemonId.textColor = .white
            return
        }
        contentView.backgroundColor = .white
        self.pokemonId.textColor = #colorLiteral(red: 0.6431372549, green: 0.6431372549, blue: 0.6431372549, alpha: 1)
    }
    
    func resetCell() {
        pokemonName.text = ""
        pokemonId.text = ""
        pokemonImg.image = UIImage()
        firstBtn.isHidden = true
        secondBtn.isHidden = true
    }
    
    func buildPokemonNumber(_ number: Int) -> String {
        return "\(number)".count > 2 ? "#\(number)" : "\(number)".count > 1 ? "#0\(number)" : "#00\(number)"
    }
    
}

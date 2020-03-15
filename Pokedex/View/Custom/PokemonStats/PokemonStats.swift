//
//  PokemonStats.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class PokemonStats: UIView {
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var typeValue: UILabel!
    @IBOutlet weak var loader: HorizontalLoader!
    
    struct Constants {
        static let xibName = "PokemonStatView"
    }
    
    var statColor: UIColor = UIColor() {
        didSet {
            setupView()
        }
    }
    
    var typeName: String = "" {
        didSet {
            type.text = typeName
        }
    }
    
    var statValue: Int = 0 {
        didSet {
            typeValue.text = buildStatNumber(statValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    fileprivate func loadViewFromNib() {
        let bundle = Bundle.init(for: PokemonStats.self)
        if let viewsToAdd = bundle.loadNibNamed(Constants.xibName, owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
    
    private func setupView() {
        loader.loaderColor = statColor
        type.textColor = statColor
    }
    
    private func buildStatNumber(_ number: Int) -> String {
        return "\(number)".count > 2 ? "\(number)" : "\(number)".count > 1 ? "0\(number)" : "00\(number)"
    }
    
}

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
    @IBOutlet weak var collectionView: UICollectionView!
    
    let options = ["STATS", "EVOLUTIONS", "MOVES"]
    private var indexStat = 0
    private var actions: [ActionCollection] = []
    
    struct Constants {
        static let cellId = "StatsCollectionViewCell"
        static let cellStatsId = "TableCollectionViewCell"
        static let cellServicesApplyId = "MultiOptionSelectCollectionViewCell"
    }
    
    var themeColor: UIColor = UIColor() {
        didSet {
            setupButtons()
            initCollectionView()
        }
    }
    
    var pokemon: Pokemon? = nil {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupButtons() {
        
        for (key, title) in options.enumerated() {
            let button = UIButton().setupMenuButton(textColor: themeColor, title: title)
            button.tag = key
            actions.append(ActionCollection(title: title, active: false, action: button))
            button.addTarget(self, action: #selector(actionCliked), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        actions[0].action.setActive(color: themeColor, radius: 23)
    }
    
    @objc func actionCliked(sender: UIButton) {
        for key in 0..<actions.count {
            actions[key].action.setDesabled(textColor: themeColor)
        }
        UIView.animate(withDuration: 0.3) {
            self.actions[sender.tag].action.setActive(color: self.themeColor, radius: 23)
            self.actions[sender.tag].active =  !self.actions[sender.tag].active
        }
        let position = indexStat == sender.tag ?  UICollectionView.ScrollPosition.top : sender.tag >  indexStat ? UICollectionView.ScrollPosition.right : UICollectionView.ScrollPosition.left
        collectionView.scrollToItem(at: IndexPath(row: sender.tag, section: 0), at: position, animated: true)
        indexStat = sender.tag
    }
    
    private func initCollectionView() {
        collectionView.register(UINib(nibName: Constants.cellId, bundle: nil), forCellWithReuseIdentifier: Constants.cellId)
    }
}

extension PokemonStackInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: Constants.cellId, for: indexPath) as! StatsCollectionViewCell
        cell.themeColor = themeColor
        cell.pokemon = pokemon
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height))
    }
}

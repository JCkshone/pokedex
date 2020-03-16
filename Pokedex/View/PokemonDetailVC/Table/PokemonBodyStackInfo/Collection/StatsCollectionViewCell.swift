//
//  StatsCollectionViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit
import Foundation

class StatsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Constants {
        static let statsCellId = "StatsTableViewCell"
    }
    var pokemon: Pokemon? = nil {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var themeColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initTableView()
    }
    
    private func initTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = tableView.bounds.height / 2
        tableView.separatorStyle = .none
    }
}

extension StatsCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemon = pokemon else { return UITableViewCell() }
        let cell = Bundle.main.loadNibNamed(Constants.statsCellId, owner: self, options: nil)?.first as! StatsTableViewCell
        cell.themeColor = themeColor
        cell.stats = pokemon.stats
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350
    }
}

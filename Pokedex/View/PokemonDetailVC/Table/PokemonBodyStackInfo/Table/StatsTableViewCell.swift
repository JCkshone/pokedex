//
//  StatsTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stats: [PokemonStat] = [] {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var themeColor: UIColor?
    
    struct Constants {
        static let cellId = "PokemonStatTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.separatorStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension StatsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let themeColor = themeColor else { return UITableViewCell()}
        
        let cell = Bundle.main.loadNibNamed(Constants.cellId, owner: self, options: nil)?.first as! PokemonStatTableViewCell
        
        cell.name = stats[indexPath.row].stat.name
        cell.number = indexPath.row + 1
        cell.selectionStyle = .none
        cell.themeColor = themeColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

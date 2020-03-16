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
    var pokemon: Pokemon? = nil {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension StatsCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

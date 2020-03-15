//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pokemonImg: UIImageView!
    typealias headerCell = PokemonInfoTableViewCell
    typealias bodyCell = PokemonStackInfoTableViewCell
    
    struct Constants {
        static let headerCellId = "PokemonInfoTableViewCell"
        static let bodyCellId = "PokemonStackInfoTableViewCell"
        static let cellId = "PokedexItemTableViewCell"
        static let quantityRows = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.willMove(toParent: nil)
        self.removeFromParent()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func initTableView() {
        tableView.roundCorners(corners: [.topLeft, .topRight], radius: 48)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = tableView.bounds.height / 2
        tableView.separatorStyle = .none
    }
}

extension PokemonDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = Bundle.main.loadNibNamed(Constants.headerCellId, owner: self, options: nil)?.first as! headerCell
            return cell
        default:
            let cell = Bundle.main.loadNibNamed(Constants.bodyCellId, owner: self, options: nil)?.first as! bodyCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.quantityRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

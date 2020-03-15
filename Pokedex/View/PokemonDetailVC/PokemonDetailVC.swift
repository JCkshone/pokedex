//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pokemonImg: UIImageView!
    
    var pokemon: Pokemon? {
        didSet {
            initTableView()
            setPokemonImg()
        }
    }
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.willMove(toParent: nil)
        self.removeFromParent()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func initTableView() {
        tableView.roundCorners(corners: [.topLeft, .topRight], radius: 48)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = tableView.bounds.height / 2
        tableView.separatorStyle = .none
    }
    
    func setPokemonImg() {
        guard let url = URL(string: HttpManager.shareInstance.getImagePokemon(of: pokemon?.id ?? 0)) else {
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

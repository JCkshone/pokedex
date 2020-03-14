//
//  PokemonVC.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class PokedexVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationView: NavigationView!
    private let viewModel = PokedexVM()
    
    struct Constants {
        static let cellId = "PokedexItemTableViewCell"
        static let titleView = "Pokemon"
        static let rowHeight = CGFloat(80)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setUpViewModel()
    }
    
    func setupView() {
        _ = self.view.setGeneralGradient()
        navigationView.addBorderView(type: .bottom, parentView: navigationView)
        navigationView.navigationTitle = Constants.titleView
        tableView.separatorColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        tableView.tableFooterView = UIView()
        self.tabBarController?.tabBar.addBorderView(type: .top, parentView: self.tabBarController?.tabBar ?? UIView())
    }
    
    func setUpViewModel() {
        viewModel.handleDataLoadComplete = { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
        viewModel.loadPokedexData()
    }
}

extension PokedexVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allPokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(Constants.cellId, owner: self, options: nil)?.first as! PokedexItemTableViewCell
        cell.resetCell()
        cell.name = viewModel.allPokemons[indexPath.row].name
        cell.pokemonNumber = indexPath.row
        cell.pokemonImgUrl = HttpManager.shareInstance.getImagePokemon(of: indexPath.row + 1)
        cell.types = viewModel.allPokemons[indexPath.row].types
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        viewModel.loadPokedexData(isFirstRequest: false)
    }
}

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
    private var startingFrame: CGRect?
    private var pokemonDetailView: UIView?
    
    private var pokemonDetail: PokemonDetailVC {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PokemonDetailVC") as! PokemonDetailVC
    }
    
    
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
        self.view.backgroundColor = .white
        tableView.keyboardDismissMode = .onDrag
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
        cell.pokemonNumber = viewModel.allPokemons[indexPath.row].id
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {
            return
        }
        
        self.startingFrame = startingFrame
        
        itemSelect(to: viewModel.allPokemons[indexPath.row])
    }
    
    func removeView(view: UIView) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            view.frame = self.startingFrame ?? .zero
            view.layer.cornerRadius = 0
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height - 83
            self.pokemonDetail.removeFromParent()
        }, completion: { _ in
            view.removeFromSuperview()
        })
    }
    
    func itemSelect(to pokemon: Pokemon) {
        guard let startingFrame = self.startingFrame else {return}
    
        let pokemonDetailView = pokemonDetail
        let contentView = pokemonDetailView.view!
        
        self.view.addSubview(contentView)
        
        contentView.frame = startingFrame
        contentView.layer.cornerRadius = 16
        
        addChild(pokemonDetailView)
        pokemonDetail.willMove(toParent: self)
        pokemonDetail.didMove(toParent: self)
        
        pokemonDetailView.pokemon = pokemon
        self.pokemonDetailView = contentView
        
        pokemonDetailView.handleDissmisView = { [weak self] in
            guard let self = self, let view =  self.pokemonDetailView else { return }
            self.removeView(view: view)
        }
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            contentView.frame = self.view.frame
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height+100
        }, completion: nil)
    }
}

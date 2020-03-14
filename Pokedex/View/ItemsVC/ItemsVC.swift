//
//  ItemsVC.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class ItemsVC: UIViewController {
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ItemVM()
    
    struct Constants {
        static let titleView = "Items"
        static let cellId = "ItemTableViewCell"
        static let rowHeight = CGFloat(75)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.handleDataLoadComplete = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        viewModel.loadPokedexData()
    }
    
    func setupView() {
        _ = self.view.setGeneralGradient()
        navigationView.addBorderView(type: .bottom, parentView: navigationView)
        navigationView.navigationTitle = Constants.titleView
        tableView.separatorColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        tableView.tableFooterView = UIView()
        self.tabBarController?.tabBar.addBorderView(type: .top, parentView: self.tabBarController?.tabBar ?? UIView())
    }
}

extension ItemsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(Constants.cellId, owner: self, options: nil)?.first as! ItemTableViewCell
        cell.itemImgUrl = viewModel.items[indexPath.row].sprites.imgUrl
        cell.name = viewModel.items[indexPath.row].name
        cell.currency = viewModel.items[indexPath.row].cost
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
    
}

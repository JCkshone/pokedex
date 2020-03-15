//
//  MovesVC.swift
//  Pokedex
//
//  Created by Juan Navarro on 14/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class MovesVC: UIViewController {
    
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = MoveVM()
    
    struct Constants {
        static let cellId = "MoveItemTableViewCell"
        static let titleView = "Moves"
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
        tableView.keyboardDismissMode = .onDrag
    }
}

extension MovesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(Constants.cellId, owner: self, options: nil)?.first as! MoveItemTableViewCell
        cell.resetCell()
        cell.name = viewModel.items[indexPath.row].name
        cell.moveIcon = viewModel.items[indexPath.row].type.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        viewModel.loadPokedexData(isFirstRequest: false)
    }
    
}

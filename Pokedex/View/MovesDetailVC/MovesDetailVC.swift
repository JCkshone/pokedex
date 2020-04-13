//
//  MovesDetailVC.swift
//  Pokedex
//
//  Created by Juan Navarro on 27/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class MovesDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var imageHeader: ImageHeader?
    
    var imageView: UIImageView = UIImageView()
    
    struct Constants {
        static let heigthPosterInView: CGFloat = 200
        static let topTableInView: CGFloat = 300
        static let offsetBottom: CGFloat = 20
        static let heigthCell: CGFloat = 110
        static let heigthSection: CGFloat = 60
        static let spaceViewToBottom: CGFloat = 34
        static let countItemsSkeleton = 3
        static let sections = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageHeader?.imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        imageView.image = UIImage(named: "squirtle")
        view.addSubview(imageView)
//        imageView.contentMode = .left
        imageView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 200)
    }
}

extension MovesDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "CELL")
        cell.textLabel!.text = "cell"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 200 - (scrollView.contentOffset.y + 200)
        let h = max(0, y)
        imageView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: h)
    }
}

//
//  NavigationView.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    @IBOutlet fileprivate weak var title: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var navigationTitle: String = "" {
        didSet {
            title.text = navigationTitle
        }
    }
    
    struct Constants {
        static let nibName = "NavigationView"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        setupView()
    }

    func loadViewFromNib() {
        let bundle = Bundle.init(for: NavigationView.self)
        if let viewsToAdd = bundle.loadNibNamed(Constants.nibName, owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
    
    func setupView() {
        searchTextField.borderStyle = .none
        searchTextField.layer.cornerRadius = searchTextField.bounds.height / 2.2
        searchTextField.layer.masksToBounds = true
        searchTextField.setLeftPaddingPoints(42)
    }
}

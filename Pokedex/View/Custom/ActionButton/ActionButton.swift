//
//  ActionBtn.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class ActionButton: UIView {

    @IBOutlet fileprivate weak var button: UIButton!
    
    var handledPressAction: (()->())?
    var actionId: Int?
    
    var active: Bool = false {
        didSet {
            button.backgroundColor = active ? defaulActiveColor : .white
            button.titleLabel?.textColor = active ? .white : defaulActiveColor
        }
    }
    
    var defaulActiveColor: UIColor = UIColor() {
        didSet {
            self.setupView()
        }
    }
    
    var title: String = "" {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }
    
    struct Constants {
        static let xibName = "ActionButton"
    }

    @IBAction func action(_ sender: Any) {
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    private func loadViewFromNib() {
        let bundle = Bundle.init(for: ActionButton.self)
        if let viewsToAdd = bundle.loadNibNamed(Constants.xibName, owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
    
    private func setupView() {
    }

}

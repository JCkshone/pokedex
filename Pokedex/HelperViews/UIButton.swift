//
//  UIButton.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    func setupMenuButton(textColor: UIColor, title : String) -> UIButton {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Avenir", size: 13)
        self.setTitleColor(textColor, for: .normal)
        return self
    }
    
    func setDesabled(textColor: UIColor) {
        self.setTitleColor(textColor, for: .normal)
        self.layer.shadowOpacity = 0
        self.layer.shadowColor = UIColor.white.cgColor
        self.backgroundColor = .white
        self.layer.cornerRadius = 0
    }
    
    func setActive(color: UIColor, radius: Float) {
        self.backgroundColor = color
        self.layer.cornerRadius = CGFloat(radius)
        self.setTitleColor(.white, for: .normal)
        self.setShadow(to: color)
    }
    
    func setShadow(to color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
    }
}

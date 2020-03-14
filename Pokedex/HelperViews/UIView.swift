//
//  UIView.swift
//  Pokedex
//
//  Created by Juan Navarro on 13/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation
import UIKit

enum BorderType {
    case top
    case bottom
}

extension UIView {
    func setGeneralGradient() -> UIView {
        let gradient = CAGradientLayer()
        let firstColor = #colorLiteral(red: 0.431372549, green: 0.5803921569, blue: 0.9921568627, alpha: 1).cgColor
        let secondColor = #colorLiteral(red: 0.4352941176, green: 0.8705882353, blue: 0.9803921569, alpha: 1).cgColor
        let thirdColor = #colorLiteral(red: 0.5529411765, green: 0.8784313725, blue: 0.3803921569, alpha: 1).cgColor
        let fortyColor = #colorLiteral(red: 0.3176470588, green: 0.9098039216, blue: 0.368627451, alpha: 1).cgColor
        gradient.colors = [firstColor, secondColor, thirdColor, fortyColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        return self
    }
    
    func setGradientSelectColor() {
        let gradient = CAGradientLayer()
        let firstColor = #colorLiteral(red: 0.3333333333, green: 0.6235294118, blue: 0.8745098039, alpha: 1).cgColor
        let secondColor = #colorLiteral(red: 0.4117647059, green: 0.7215686275, blue: 0.8901960784, alpha: 1).cgColor
        gradient.colors = [firstColor, secondColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.opacity = 0.7
    }
    
    func addBorderView(type: BorderType, parentView: UIView, borderWidth: CGFloat = 4) {
        let border = UIView()
        border.backgroundColor = .red
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: type == BorderType.top ? 0 :
            parentView.frame.height - borderWidth, width: parentView.frame.size.width, height: borderWidth)
        parentView.addSubview(border.setGeneralGradient())
    }
}

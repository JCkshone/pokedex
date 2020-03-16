//
//  UIProgressView.swift
//  Pokedex
//
//  Created by Juan Navarro on 16/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation
import UIKit

extension UIProgressView {
    var barHeight: CGFloat {
        get {
            return transform.d * 2.0
        }
        set {
            let heightScale = newValue / 2.0
            let c = center
            transform = CGAffineTransform(scaleX: 1.0, y: heightScale)
            center = c
        }
    }
}

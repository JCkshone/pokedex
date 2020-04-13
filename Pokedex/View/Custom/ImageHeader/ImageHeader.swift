//
//  ImageHeader.swift
//  Pokedex
//
//  Created by Juan Navarro on 27/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation
import UIKit

class ImageHeader: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    var contentView: UIView!
    
    struct Constants {
        static let xibName = "ImageHeader"
    }
    
    convenience init(height: CGFloat) {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: height) ) )
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
    }
    func showImage(nameImage: String) {
        imageView.image = UIImage(named: nameImage)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: Constants.xibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

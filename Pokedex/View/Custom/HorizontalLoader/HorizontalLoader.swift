//
//  HorizontalLoader.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class HorizontalLoader: UIView {
    
    struct Constants {
        static let xibName = "HorizontalLoader"
    }
    
    @IBOutlet weak var rootContent: UIView!
    
    private var progress = Progress(totalUnitCount: 100)
    private var timerStep = 0.5
    private var timerRepeat = 1
    private var progressView = UIProgressView(progressViewStyle: .default)
    
    
    var loaderColor: UIColor = UIColor() {
        didSet {
            setupLoader()
        }
    }
    
    var initLoading: Bool = false{
        didSet {
            setupAnimation(progressView)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    fileprivate func loadViewFromNib() {
        let bundle = Bundle.init(for: HorizontalLoader.self)
        if let viewsToAdd = bundle.loadNibNamed(Constants.xibName, owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
    
    fileprivate func setupLoader() {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
//        view.backgroundColor = .green
//        view.addSubview(setupLoaderStyle())
//        rootContent.addSubview(view)
        rootContent.addSubview(setupLoaderStyle())
    }
    
    fileprivate func setupLoaderStyle() -> UIProgressView{
        progressView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 4)
        progressView.clipsToBounds = true
        progressView.progressTintColor = loaderColor
//        progressView.transform = CGAffineTransform(scaleX: 5, y: 4)
//        progressView.frame = CGRect(x: 0, y: 20, width: 200, height: 50)
        progressView.backgroundColor = .blue
        return progressView
    }
    
    fileprivate func setupAnimation(_ view: UIProgressView) {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            
            guard self.progress.isFinished == false else {
                timer.invalidate()
                self.progress = Progress(totalUnitCount: 5)
                self.timerStep += 1
                self.timerRepeat += 1
                return
            }
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            view.setProgress(progressFloat, animated: true)
            
        }
    }
}

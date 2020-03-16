//
//  PokemonStatTableViewCell.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import UIKit

class PokemonStatTableViewCell: UITableViewCell {
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var typeValue: UILabel!
    @IBOutlet weak var horizontalLoader: HorizontalLoader!
    @IBOutlet weak var progressView: UIProgressView!
    private var progress = Progress(totalUnitCount: 100)
    private var timerStep = 0.5
    private var timerRepeat = 1
    
    var name: String = "" {
        didSet {
            typeName.text = name
        }
    }
    
    var number: Int = 0 {
        didSet {
            typeValue.text = buildStatNumber(number)
        }
    }
    
    var themeColor: UIColor = UIColor() {
        didSet {
            typeName.textColor = themeColor
            typeValue.textColor = themeColor
            setupLoader()
        }
    }
    
    func setupLoader()  {
        progressView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10)
        progressView.barHeight = CGFloat(10)
        progressView.progressTintColor = themeColor
        setupAnimation(progressView)
        progressView.clipsToBounds = true
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func buildStatNumber(_ number: Int) -> String {
        return "\(number)".count > 2 ? "\(number)" : "\(number)".count > 1 ? "0\(number)" : "00\(number)"
    }
}

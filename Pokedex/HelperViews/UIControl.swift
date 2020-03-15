//
//  UIControl.swift
//  Pokedex
//
//  Created by Juan Navarro on 15/03/20.
//  Copyright © 2020 Juan Navarro. All rights reserved.
//

import Foundation
import UIKit

struct Themes {
    let bug: [UIColor]      = [#colorLiteral(red: 0.5764705882, green: 0.737254902, blue: 0.1725490196, alpha: 1), #colorLiteral(red: 0.6901960784, green: 0.7843137255, blue: 0.2117647059, alpha: 1)]
    let dark: [UIColor]     = [#colorLiteral(red: 0.3490196078, green: 0.3411764706, blue: 0.3803921569, alpha: 1), #colorLiteral(red: 0.431372549, green: 0.4588235294, blue: 0.5294117647, alpha: 1)]
    let dragon: [UIColor]   = [#colorLiteral(red: 0.04705882353, green: 0.4156862745, blue: 0.7843137255, alpha: 1), #colorLiteral(red: 0.003921568627, green: 0.4941176471, blue: 0.7803921569, alpha: 1)]
    let electric: [UIColor] = [#colorLiteral(red: 0.9294117647, green: 0.8392156863, blue: 0.2431372549, alpha: 1), #colorLiteral(red: 0.9843137255, green: 0.8862745098, blue: 0.4509803922, alpha: 1)]
    let fairy: [UIColor]    = [#colorLiteral(red: 0.9254901961, green: 0.5490196078, blue: 0.9019607843, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.6549019608, blue: 0.9098039216, alpha: 1)]
    let fighting: [UIColor] = [#colorLiteral(red: 0.8078431373, green: 0.2588235294, blue: 0.3960784314, alpha: 1), #colorLiteral(red: 0.9058823529, green: 0.262745098, blue: 0.2745098039, alpha: 1)]
    let fire: [UIColor]     = [#colorLiteral(red: 0.9843137255, green: 0.6078431373, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.9843137255, green: 0.6784313725, blue: 0.2745098039, alpha: 1)]
    let flying: [UIColor]   = [#colorLiteral(red: 0.5647058824, green: 0.6549019608, blue: 0.8549019608, alpha: 1), #colorLiteral(red: 0.6509803922, green: 0.7607843137, blue: 0.9490196078, alpha: 1)]
    let ghost: [UIColor]    = [#colorLiteral(red: 0.3176470588, green: 0.4117647059, blue: 0.6745098039, alpha: 1), #colorLiteral(red: 0.462745098, green: 0.4509803922, blue: 0.831372549, alpha: 1)]
    let grass: [UIColor]    = [#colorLiteral(red: 0.3725490196, green: 0.737254902, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.3529411765, green: 0.7568627451, blue: 0.4666666667, alpha: 1)]
    let ground: [UIColor]   = [#colorLiteral(red: 0.862745098, green: 0.4588235294, blue: 0.2705882353, alpha: 1), #colorLiteral(red: 0.8235294118, green: 0.5764705882, blue: 0.3882352941, alpha: 1)]
    let ice: [UIColor]      = [#colorLiteral(red: 0.4392156863, green: 0.8, blue: 0.7411764706, alpha: 1), #colorLiteral(red: 0.5490196078, green: 0.8666666667, blue: 0.831372549, alpha: 1)]
    let normal: [UIColor]   = [#colorLiteral(red: 0.5725490196, green: 0.5960784314, blue: 0.6431372549, alpha: 1), #colorLiteral(red: 0.6392156863, green: 0.6431372549, blue: 0.6196078431, alpha: 1)]
    let poison: [UIColor]   = [#colorLiteral(red: 0.6588235294, green: 0.3921568627, blue: 0.7803921569, alpha: 1), #colorLiteral(red: 0.7647058824, green: 0.3803921569, blue: 0.831372549, alpha: 1)]
    let psychic: [UIColor]  = [#colorLiteral(red: 0.9647058824, green: 0.4352941176, blue: 0.4431372549, alpha: 1), #colorLiteral(red: 0.9960784314, green: 0.6235294118, blue: 0.5725490196, alpha: 1)]
    let rock: [UIColor]     = [#colorLiteral(red: 0.7725490196, green: 0.7058823529, blue: 0.537254902, alpha: 1), #colorLiteral(red: 0.8431372549, green: 0.8078431373, blue: 0.5647058824, alpha: 1)]
    let steel: [UIColor]    = [#colorLiteral(red: 0.3215686275, green: 0.5294117647, blue: 0.6156862745, alpha: 1), #colorLiteral(red: 0.3450980392, green: 0.6509803922, blue: 0.6666666667, alpha: 1)]
    let water: [UIColor]    = [#colorLiteral(red: 0.3333333333, green: 0.6235294118, blue: 0.8745098039, alpha: 1), #colorLiteral(red: 0.4117647059, green: 0.7215686275, blue: 0.8901960784, alpha: 1)]
}

class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    
    func deleteActions(){
        self.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    func addAction(for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
extension Sequence {
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
}

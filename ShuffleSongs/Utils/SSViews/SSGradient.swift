//
//  SSGradient.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import UIKit

@IBDesignable
class SSGradient: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    override class var layerClass: AnyClass {
        get { return CAGradientLayer.self }
    }
    
    func setupGradient() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map { $0.cgColor }
        layer.startPoint = CGPoint(x: 0.5, y: 0.45)
        layer.endPoint = CGPoint (x: 0.75, y: 1)
    }
    
}

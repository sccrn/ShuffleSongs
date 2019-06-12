//
//  UIView.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-12.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    public func roundCorner(with radius: CGFloat, to corners: UIRectCorner = .allCorners) {
        if corners == .allCorners {
            layer.cornerRadius = radius
            return
        }
        
        if #available(iOS 11.0, *) {
            layer.cornerRadius = radius
            var cornerMasks: CACornerMask = []
            if corners.contains(.topLeft) { cornerMasks.insert(.layerMinXMinYCorner) }
            if corners.contains(.topRight) { cornerMasks.insert(.layerMaxXMinYCorner) }
            if corners.contains(.bottomLeft) { cornerMasks.insert(.layerMinXMaxYCorner) }
            if corners.contains(.bottomRight) { cornerMasks.insert(.layerMaxXMaxYCorner) }
            
            layer.maskedCorners = cornerMasks
            
        } else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = frame
            rectShape.position = center
            rectShape.path = UIBezierPath(roundedRect: bounds,
                                          byRoundingCorners: corners,
                                          cornerRadii: CGSize(width: radius, height: radius))
                .cgPath
            
            // masking the view layer with rectShape layer
            layer.mask = rectShape
        }
    }

    func addBottomBorder() {
        let border = UIView()
        border.tag = 1
        border.backgroundColor = .separator
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .height,
                                                multiplier: 1, constant: 1))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .bottom,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .leading,
                                              multiplier: 1, constant: 16))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .trailing,
                                              multiplier: 1, constant: -16))
    }
}

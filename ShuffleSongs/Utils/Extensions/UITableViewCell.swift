//
//  UITableViewCell.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    
    ///Return identifier with the same name of the subclass
    static var defaultIdentifier: String {
        return String(describing: self)
    }
}

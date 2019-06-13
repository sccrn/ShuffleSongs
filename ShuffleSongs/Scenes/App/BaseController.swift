//
//  BaseController.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

///In our basic viewController, we're gonna set up all methods that we're gonna need.
class BaseController: UIViewController {
    public init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

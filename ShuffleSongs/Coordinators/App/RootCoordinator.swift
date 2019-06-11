//
//  RootCoordinator.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

public protocol RootControllerProvider: class {
    //This rootViewController is the root of the coordinators.
    //It can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
}

///The typealias is been implemented to use this RootCoordinator to provides a root UIViewController
public typealias RootCoordinator = Coordinator & RootControllerProvider

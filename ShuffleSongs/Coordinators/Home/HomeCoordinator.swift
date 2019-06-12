//
//  HomeCoordinator.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: RootCoordinator {
    ///Our protocols.
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return self.navigationController }
    
    private lazy var navigationController: UINavigationController = {
        let navigation = SSNavigationController(rootController: nil)
        return navigation
    }()
    
    ///Our start's function to begin the flow.
    func start() {
        let home = HomeController()
        navigationController.pushViewController(home, animated: true)
    }
}

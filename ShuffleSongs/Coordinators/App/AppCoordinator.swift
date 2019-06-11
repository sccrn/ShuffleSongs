//
//  AppCoordinator.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

///This coordinator is the first one and will be the rootViewController
class AppCoordinator: RootCoordinator {
    
    ///These are the RootCoordinator's protocol.
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return  navigationController }
    
    ///This is navigation controller and where will be import the navigationController's custom.
    private lazy var navigationController: UINavigationController = {
        let navigationController = SSNavigationController(rootController: nil)
        return navigationController
    }()
    
    ///Window to manage
    let window: UIWindow
    
    ///The initialization of our window.
    public init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.rootViewController
        self.window.backgroundColor = .white
        self.window.makeKeyAndVisible()
    }
    
    
    public func start() {
        let splash = SplashController(viewModel: SplashViewModel(coordinatorDelegate: self))
        rootViewController.present(splash, animated: false, completion: nil)
    }
    
    private func setupHome() {
        let home = HomeCoordinator()
        home.start()
        addChildCoordinator(childCoordinator: home)
        rootViewController.present(home.rootViewController, animated: false, completion: nil)
    }
}

extension AppCoordinator: SplashCoordinatorDelegate {
    func didFinish(controller: SplashController) {
        controller.dismiss(animated: false, completion: nil)
        childCoordinators.forEach { self.removeChildCoordinator(childCoordinator: $0) }
        setupHome()
    }
}

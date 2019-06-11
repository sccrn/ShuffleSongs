//
//  SplashViewModel.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

protocol SplashCoordinatorDelegate: class {
    func didFinish(controller: SplashController)
}

class SplashViewModel {
    weak var coordinatorDelegate: SplashCoordinatorDelegate?
    
    init(coordinatorDelegate: SplashCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
}

//
//  Coordinator.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

///Coordinator's protocol
public protocol Coordinator: class {
    
    /// Child coordinators's array of all app.
    var childCoordinators: [Coordinator] { get set }
}

public extension Coordinator {
    
    ///Function to add a child coordinator to the parent coordinator.
    public func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    ///Function to remove a child coordinator from the parent coordinator.
    public func removeChildCoordinator(childCoordinator: Coordinator) {
        //Using the filter to only contains in the new childCoodinators's array the elements
        //that are different of the childCoordinator that was received.
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}

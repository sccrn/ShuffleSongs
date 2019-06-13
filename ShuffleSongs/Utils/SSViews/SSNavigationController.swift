//
//  SSNavigationController.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import UIKit

///This is the app's navigationController and in here it's gonna customized.
class SSNavigationController: UINavigationController {
    
    //Our navigationBar will be the navigationBar of our navigationController that will be customized in
    //this init.
    convenience init(rootController: UIViewController? = nil) {
        self.init(navigationBarClass: SSNavigationBar.self, toolbarClass: nil)
        
        if let rootViewController = rootController { viewControllers = [rootViewController] }
        navigationBar.isTranslucent = false
    }
}

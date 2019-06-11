//
//  SplashController.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

class SplashController: BaseController {
    private var viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.initError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplash()
    }
    
    private func setupSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.viewModel.coordinatorDelegate?.didFinish(controller: self)
        }
    }
}

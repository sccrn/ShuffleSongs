//
//  SSNavigationBar.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import UIKit

///Our navigationBar's customized
class SSNavigationBar: UINavigationBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///navigation bar's configuration.
    private func setupAppNavigationBar() {
        barTintColor = .navigationController
        tintColor = .white
        titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

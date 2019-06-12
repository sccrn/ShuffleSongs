//
//  HomeDataSource.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

///This is our dataSource to set up our tableview and anothers methods that
///depends of something of our tableviewDataSource/tableViewDelegate.
class HomeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

extension HomeDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: HomeCell.self, indexPath: indexPath)
        cell.configure(musicModel: viewModel.typeOfMusic(for: indexPath.row))
        return cell
    }
}

extension HomeDataSource {
    class func setupHome(tableView: UITableView?) {
        tableView?.registerNib(cellClass: HomeCell.self)
    }
}

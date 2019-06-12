//
//  HomeController.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

class HomeController: BaseController {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel: HomeViewModel = HomeViewModel()
    private var tableViewDataSource: HomeDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNavBar()
        setupTableView()
        loadLayout()
    }
    
    private func loadNavBar() {
        navigationItem.title = Constants.homeScreen
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "shuffle"), style: .done, target: self, action: #selector(actionShuffle))
    }
    
    @objc private func actionShuffle() {
        loading.startAnimating()
        viewModel.loadMusics()
    }
    
    private func loadLayout() {
        viewModel.delegate = self
        loading.startAnimating()
        viewModel.loadMusics()
    }
    
    private func setupTableView() {
        HomeDataSource.setupHome(tableView: tableView)
        tableViewDataSource = HomeDataSource(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.ops, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Constants.ok, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeController: HomeDelegate {
    func didFinish(with state: HomeState) {
        switch state {
        case .success:
            loading.stopAnimating()
            loading.hidesWhenStopped = true
            tableView.reloadData()
        case .failure(let err):
            loading.stopAnimating()
            loading.hidesWhenStopped = true
            showAlert(message: err.localizedDescription)
        }
    }
}

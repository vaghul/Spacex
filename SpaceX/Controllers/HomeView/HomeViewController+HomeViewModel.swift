//
//  HomeViewController+HomeViewModel.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-03.
//

import Foundation

extension HomeViewController:HomeViewModelDelegate {
    func endRefreshing() {
        if let refresh = self.tableView.refreshControl?.isRefreshing,refresh {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    func reloadTableView() {
        endRefreshing()
        self.footerView.isHidden = true
        self.tableView.reloadData()
    }
    func loadingMoreLaunches() {
        self.footerView.isHidden = false
    }
    func loadingFailed() {
        endRefreshing()
        self.footerView.isHidden = true
        self.showAlert(title: "general.error".localize(), message: viewModel.getApiError())
    }
}

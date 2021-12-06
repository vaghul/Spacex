//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-01.
//

import UIKit

class HomeViewController: UITableViewController {
    
    @IBOutlet weak var footerView: UIView!
    internal let viewModel = HomeViewModel()
    private let cellIdentifier = "LaunchesCell"

   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "home.title".localize()
        
        viewModel.delegate = self
        viewModel.getLaunches(page: 1)
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)

    }
    
    @objc func refresh(_ sender: Any) {
        viewModel.getLaunches(page: 1)
    }
 

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel.getNumberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.getNumberOfRows(for: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeViewCell

        if let cellvalue = viewModel.getLaunches(for: indexPath.section, at: indexPath.item) {
            cell.setCellValues(launchinfo: cellvalue)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.validateAndPaginate(for: indexPath.section, at: indexPath.item)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController.prepare(from: .DetailViewController)
        detailVC.modalPresentationStyle = .popover
        detailVC.viewModel.launchinfo = viewModel.getLaunches(for: indexPath.section, at: indexPath.item)
        self.present(detailVC, animated: true)
    }


}

//
//  DetailViewController+UITableView.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-03.
//

import UIKit

//Following Decorator Pattern

extension DetailViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value  = viewModel.getinfo(for: indexPath.item)
        
        if value.type == .infoview,let cellvalue = value.value as? [String:String] {
            let cell = tableView.dequeueReusableCell(withIdentifier: value.type.rawValue, for: indexPath) as! InfoViewCell
            cell.setupCell(value: cellvalue)
            return cell
        }else if value.type == .description,let cellvalue = value.value as? String {
            let cell = tableView.dequeueReusableCell(withIdentifier: value.type.rawValue, for: indexPath) as! DescriptionCell
            cell.setupView(description: cellvalue)
            return cell
        }else if value.type == .missionimage {
            let cell = tableView.dequeueReusableCell(withIdentifier: value.type.rawValue, for: indexPath) as! MissionImageCell
            cell.delegate = self
            cell.setupView()
            return cell
        }
        
        return UITableViewCell()
    }
}

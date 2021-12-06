//
//  InfoViewCell.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import UIKit

class InfoViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    
    func setupCell(value:[String:String]) {
        if let title = value["title"] {
            labelTitle.text = title
        }
        if let textvalue = value["value"] {
            labelValue.text = textvalue
        }
    }
}

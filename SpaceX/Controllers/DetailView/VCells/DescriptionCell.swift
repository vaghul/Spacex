//
//  DescriptionCell.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    
    func setupView(description:String) {
        self.labelDescription.text = description
    }
}




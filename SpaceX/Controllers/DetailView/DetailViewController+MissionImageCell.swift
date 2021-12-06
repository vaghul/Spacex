//
//  DetailViewController+MissionImageCell.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-03.
//

import UIKit

//Following Decorator Pattern

extension DetailViewController:MissionImageCellDelegate  {
    func getMissionCount() -> Int {
        viewModel.getNumberOfMissionImage()
    }
    
    func getMisionImage(at: Int) -> String? {
        viewModel.getMissionImage(at: at)
    }
    
    
}

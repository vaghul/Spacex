//
//  HomeViewCell.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import UIKit
import Kingfisher

class HomeViewCell: UITableViewCell {

   
    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var viewStatus: UIView!
    
    private let placeholderImage = UIImage(named: "missionPlaceholder")
    
    func setCellValues(launchinfo:LaunchesPastQuery.Data.LaunchesPast) {
        
        setCellDefault()
        
        if let imageurl = launchinfo.links?.missionPatch{
            let url = URL(string: imageurl)
            let processor = DownsamplingImageProcessor(size: imageThumb.bounds.size)
            imageThumb.kf.indicatorType = .activity
            imageThumb.kf.setImage(
                with: url,
                placeholder: placeholderImage,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
        
        if let titleText = launchinfo.missionName {
            labelTitle.text = titleText
        }
        if let subtitleText = launchinfo.launchYear {
            labelSubtitle.text = "\("home.launchIn".localize()) \(subtitleText)"
        }
        
        if let launchsuccess = launchinfo.launchSuccess {
            if launchsuccess {
                viewStatus.backgroundColor = .systemGreen
            }else {
                viewStatus.backgroundColor = .systemRed
            }
        }
        
    }
    
    private func setCellDefault() {
        imageThumb.image = placeholderImage
        imageThumb.layer.masksToBounds = true
        imageThumb.layer.cornerRadius = imageThumb.frame.height/2
        imageThumb.contentMode = .scaleAspectFill
        labelTitle.text = ""
        labelSubtitle.text = ""
        viewStatus.backgroundColor = .white
        viewStatus.layer.masksToBounds = true
        viewStatus.layer.cornerRadius = viewStatus.frame.height/2

    }
    
    func cancelImageDownload() {
        imageThumb.kf.cancelDownloadTask()
    }

}

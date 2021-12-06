//
//  ImageHViewCell.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import UIKit
import Kingfisher

class ImageHViewCell: UICollectionViewCell {

    @IBOutlet weak var imageMission: UIImageView!
    private let placeholderImage = UIImage(named: "missionDetailPlaceholder")

    func setImage(url:String?) {
        setCellDefaults()
        if  let imageurl = url {
            let url = URL(string: imageurl)
            imageMission.kf.indicatorType = .activity
            imageMission.kf.setImage(
                with: url,
                placeholder: placeholderImage,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(0.8)),
                    .cacheOriginalImage
                ])
        }
    }
    
    
    private func setCellDefaults() {
        imageMission.image = placeholderImage
        imageMission.contentMode = .scaleAspectFill
        imageMission.clipsToBounds = true
        self.imageMission.layer.cornerRadius = 20.0
        self.imageMission.layer.masksToBounds = true
    }
    
}

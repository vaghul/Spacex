//
//  MissionImageCell.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import UIKit


protocol MissionImageCellDelegate:AnyObject {
    func getMissionCount() -> Int
    func getMisionImage(at:Int) -> String?
}

class MissionImageCell: UITableViewCell {

    private let gridspacing:CGFloat = 10
    private let identifier = "ImageHCell"
    weak var delegate:MissionImageCellDelegate?
    
    @IBOutlet weak var collectionImages: UICollectionView!

    
    func setupView() {
        collectionImages.delegate = self
        collectionImages.dataSource = self
        collectionImages.reloadData()
    }
}



extension MissionImageCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getMissionCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageHViewCell
        cell.setImage(url: delegate?.getMisionImage(at: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return gridspacing
    }
    
}

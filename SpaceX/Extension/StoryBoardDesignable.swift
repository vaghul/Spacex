//
//  StoryBoardDesignable.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-03.
//

import Foundation
import UIKit


enum StoryBoard : String {
    case DetailViewController = "DetailViewController"
}

protocol StoryBoardDesignable : AnyObject {
    
}


extension StoryBoardDesignable where Self: UIViewController {
    
    static func prepare(from storyboard:StoryBoard,bundle:Bundle = Bundle(for: Self.self)) -> Self {
        
        let dynamicMetatype = Self.self
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: bundle)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "\(dynamicMetatype)") as? Self else {
            fatalError("Could not Create View Controller \(dynamicMetatype)")
        }
        return viewController
    }
}

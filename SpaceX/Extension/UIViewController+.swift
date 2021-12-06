//
//  UIViewController+.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import Foundation
import SafariServices




extension UIViewController :StoryBoardDesignable {
    
    func showAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "general.okay".localize(), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentBrowser(url : URL) {
        let browser = SFSafariViewController(url: url)
        browser.modalPresentationStyle = .overFullScreen
        self.present(browser, animated: true)
    }
}

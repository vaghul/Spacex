//
//  DetailViewController.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import UIKit
import SafariServices




class DetailViewController: UIViewController {

    
    @IBOutlet weak var navigatetionTitle: UINavigationItem!
    @IBOutlet weak var viewTable: UITableView!
    
    @IBOutlet weak var buttonArticle: UIButton!
    @IBOutlet weak var buttonVideo: UIButton!
    @IBOutlet weak var buttonWiki: UIButton!
    @IBOutlet weak var buttonClose: UIBarButtonItem!
    
    internal var viewModel = DetailsViewModel()
    var launchid:String?
   
    fileprivate func setupArticleBar() {
        buttonArticle.isHidden = !viewModel.isArticleAvailable(for: .article)
        buttonVideo.isHidden = !viewModel.isArticleAvailable(for: .video)
        buttonWiki.isHidden = !viewModel.isArticleAvailable(for: .wiki)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        buttonClose.title = "general.close".localize()
        
        navigatetionTitle.title = viewModel.getMissionName()
        
        viewModel.delegate = self
        viewTable.delegate = self
        viewTable.dataSource = self
        viewTable.reloadData()
        
        setupArticleBar()
    

        if let launch = launchid {
            viewModel.getLaunches(by: launch)
        }
    }
    
    @IBAction func onClickClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onClickAlert(_ sender: Any) {
        if let url = viewModel.getArticleLink(for: .article) {
            presentBrowser(url: url)
        }
        
    }
    @IBAction func onClickVideo(_ sender: Any) {
        if let url = viewModel.getArticleLink(for: .video) {
            presentBrowser(url: url)
        }
    }
    @IBAction func onClickWiki(_ sender: Any) {
        if let url = viewModel.getArticleLink(for: .wiki) {
            presentBrowser(url: url)
        }
    }
}


extension DetailViewController:DetailsViewModelDelegate {
    func reloadTableView() {
        navigatetionTitle.title = viewModel.getMissionName()
        viewTable.reloadData()
    }
    
    func loadingFailed(error:String) {
        self.showAlert(title: "general.error".localize(), message: error)
    }
    
    
}

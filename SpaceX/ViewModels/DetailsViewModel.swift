//
//  DetailsViewModel.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import Foundation

public enum DetailViewElementType:String {
    case description
    case missionimage
    case infoview
}

struct DetailViewElement {
    var type:DetailViewElementType
    var value:AnyObject
}

enum ArticleType {
    case article
    case video
    case wiki
}

protocol DetailsViewModelDelegate:AnyObject {
    func reloadTableView()
    func loadingFailed(error:String)
}

public class DetailsViewModel {
    var launchinfo: LaunchesPastQuery.Data.LaunchesPast? {
        didSet{
            self.setup()
        }
    }
    var launchdetailinfo: LaunchQuery.Data.Launch? {
        didSet{
            self.setup()
        }
    }
    weak var delegate:DetailsViewModelDelegate?
    var array = [DetailViewElement]()
   
    func setup() {
        array.removeAll()
        if launchdetailinfo != nil {
            if let images = launchdetailinfo?.links?.flickrImages, let val = images as? [String], !val.isEmpty  {
                array.append(DetailViewElement(type: .missionimage, value: val as AnyObject))
            }

            if let launchsite = launchdetailinfo?.launchSite?.siteNameLong {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Launch Site:","value":launchsite] as AnyObject))
            }

            if let launchyear = launchdetailinfo?.launchYear {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Launch Year:","value":launchyear] as AnyObject))
            }

            if let rocket = launchdetailinfo?.rocket?.rocketName, let rockettype = launchinfo?.rocket?.rocketType {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Rocket:","value":"\(rocket) [\(rockettype)]"] as AnyObject))
            }

            if let status = launchdetailinfo?.launchSuccess {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Launch Status:","value":status ? "Success" : "failure"] as AnyObject))
            }

            if let missiondetails = launchdetailinfo?.details, missiondetails != "" {
                array.append(DetailViewElement(type: .description, value: missiondetails as AnyObject))
            }
        }else{
            if let images = launchinfo?.links?.flickrImages, let val = images as? [String], !val.isEmpty  {
                array.append(DetailViewElement(type: .missionimage, value: val as AnyObject))
            }

            if let launchsite = launchinfo?.launchSite?.siteNameLong {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Launch Site:","value":launchsite] as AnyObject))
            }

            if let launchyear = launchinfo?.launchYear {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Launch Year:","value":launchyear] as AnyObject))
            }

            if let rocket = launchinfo?.rocket?.rocketName, let rockettype = launchinfo?.rocket?.rocketType {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Rocket:","value":"\(rocket) [\(rockettype)]"] as AnyObject))
            }

            if let status = launchinfo?.launchSuccess {
                array.append(DetailViewElement(type: .infoview, value: ["title":"Launch Status:","value":status ? "Success" : "failure"] as AnyObject))
            }

            if let missiondetails = launchinfo?.details, missiondetails != "" {
                array.append(DetailViewElement(type: .description, value: missiondetails as AnyObject))
            }
        }
    }

    func getLaunches(by ID:String) {

        Network.shared.apollo.cacheKeyForObject = { $0["id"] }
        Network.shared.apollo.fetch(query:  LaunchQuery(launchId: ID), cachePolicy: .fetchIgnoringCacheData, contextIdentifier: nil, queue: DispatchQueue.global()) {  [unowned self] result in
            switch result {
             case .success(let graphQLResult):
               print("Success! Result: \(graphQLResult)")
                if let errors = graphQLResult.errors {
                     let message = errors
                                     .map { $0.localizedDescription }
                                     .joined(separator: "\n")
                    dataLoadingFailed(with: message)
                }else if let launchesResults = graphQLResult.data?.launch {
                    launchdetailinfo = launchesResults
                    self.dataLoadingComplete()
                }else{
                    self.dataLoadingFailed(with: "Invalid Launch ID")
                }

             case .failure(let error):
               print("Failure! Error: \(error)")
                dataLoadingFailed(with: error.localizedDescription)
             }

        }
    }

    private func dataLoadingComplete() {
        DispatchQueue.main.async { [ unowned self] in
            self.delegate?.reloadTableView()
        }
    }

    private func dataLoadingFailed(with error:String) {
        DispatchQueue.main.async { [ unowned self] in
            self.delegate?.loadingFailed(error: error)
        }
    }

    func getMissionName() -> String {
        return launchdetailinfo?.missionName ?? launchinfo?.missionName ??  ""
    }

    func isArticleAvailable(for type:ArticleType) -> Bool {
        switch type {
        case .article:
            return launchinfo?.links?.articleLink != nil
        case .video:
            return launchinfo?.links?.videoLink != nil
        case .wiki:
            return launchinfo?.links?.wikipedia != nil
        }
    }

    func getArticleLink(for type:ArticleType) -> URL? {
        switch type {
        case .article:
            if let link = launchinfo?.links?.articleLink, let url = URL(string: link) {
                return url
            }
        case .video:
            if let link = launchinfo?.links?.videoLink, let url = URL(string: link) {
                return url
            }
        case .wiki:
            if let link = launchinfo?.links?.wikipedia, let url = URL(string: link) {
                return url
            }
        }
        return nil
    }

    func getNumberOfRows() -> Int {
        return array.count
    }
    func getinfo(for index:Int) -> DetailViewElement {
        return array[index]
    }

    // Mission Image Helpers


    func getNumberOfMissionImage() -> Int {
        if array[0].type == .missionimage, let images = array[0].value as? [String] {
            return images.count
        }
        return 0
    }

    func getMissionImage(at index:Int) -> String? {
        if array[0].type == .missionimage, let images = array[0].value as? [String] {
            return images[index]
        }
        return nil
    }

}

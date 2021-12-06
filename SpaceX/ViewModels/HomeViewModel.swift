//
//  HomeViewModel.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-02.
//

import Foundation

protocol HomeViewModelDelegate:AnyObject {
    func reloadTableView()
    func loadingMoreLaunches()
    func loadingFailed()
}

public class HomeViewModel {
    
    enum ListSection: Int, CaseIterable {
        case launchespast
    }
    weak var delegate:HomeViewModelDelegate?
    private var launches = [LaunchesPastQuery.Data.LaunchesPast]()
    private let pageLimit = 20
    private var isLoading = false
    private var isNextLoadAvailable = true
    private let paginationThreshold = 60/100
    private var completedpages = 0
    private var apiError:String? = nil
    
    func getLaunches(page:Int) {
        
        guard page > 0 else {
            return
        }
        
        isLoading = true
        delegate?.loadingMoreLaunches()
        Network.shared.apollo.cacheKeyForObject = { $0["id"] }
        Network.shared.apollo.fetch(query: LaunchesPastQuery(limit:pageLimit, offset: (page - 1) * pageLimit), cachePolicy: .fetchIgnoringCacheData, contextIdentifier: nil, queue: DispatchQueue.global()) {  [unowned self] result in
            apiError = nil
            switch result {
             case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                     let message = errors
                                     .map { $0.localizedDescription }
                                     .joined(separator: "\n")
                    apiError = message
                    dataLoadingFailed(for: page)
                 }else if let launchesResults = graphQLResult.data?.launchesPast {
                    let launchList = launchesResults.compactMap { $0 }
                    isNextLoadAvailable = (launchList.count % pageLimit == 0)
                    self.launches.append(contentsOf:launchList)
                    self.dataLoadingComplete(for: page)
                }
               
             case .failure(let error):
                apiError = error.localizedDescription
                dataLoadingFailed(for: page)
             }
         
        }
    }
    
    private func dataLoadingComplete(for page:Int) {
        DispatchQueue.main.async { [ unowned self] in
            self.completedpages = page
            self.isLoading = false
            self.delegate?.reloadTableView()
        }
    }

    private func dataLoadingFailed(for page:Int) {
        DispatchQueue.main.async { [ unowned self] in
            self.isNextLoadAvailable = false
            self.completedpages = page
            self.isLoading = false
            self.delegate?.loadingFailed()
        }
    }

    func getApiError() -> String{
        return apiError ?? "SomeThing Went Wrong!"
    }
    
    func getNumberOfSections() -> Int {
        return ListSection.allCases.count
    }
    
    func getNumberOfRows(for section:Int) -> Int {
        guard let listSection = ListSection(rawValue: section) else {
            assertionFailure("Invalid section")
            return 0
          }
                
          switch listSection {
          case .launchespast:
              return self.launches.count
          }
    }
    
    func getLaunches(for section:Int,at index:Int) -> LaunchesPastQuery.Data.LaunchesPast? {
        guard let listSection = ListSection(rawValue: section) else {
            assertionFailure("Invalid section")
            return nil
          }
        switch listSection {
            case .launchespast:
                return launches[index]
        }
        
    }
    
    func validateAndPaginate(for section:Int, at index:Int) {
        guard isLoading == false,isNextLoadAvailable == true else {
            return
        }
        let totalRows = getNumberOfRows(for: section)
        print(totalRows,index,(totalRows - Int(totalRows * paginationThreshold)))
        if index > (totalRows - Int(totalRows * 60/100)) {
            getLaunches(page: completedpages + 1)
        }
    }
    
}

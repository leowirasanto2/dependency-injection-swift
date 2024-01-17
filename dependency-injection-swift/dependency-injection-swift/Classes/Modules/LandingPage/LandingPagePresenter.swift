//  
//  LandingPagePresenter.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation

class LandingPagePresenter: ILandingPagePresenter {
    private let interactor: ILandingPageInteractor
    private let router: ILandingPageRouter
    private let parameters: [String: Any]?
    private let bridging: IBridging?
    weak var view: ILandingPageViewController?
    
    init(bridging: IBridging?, interactor: ILandingPageInteractor, router: ILandingPageRouter, parameters: [String: Any]?) {
        self.interactor = interactor
        self.router = router
        self.parameters = parameters
        self.bridging = bridging
    }
    
    func viewDidLoad(view: ILandingPageViewController) {
        self.view = view
        interactor.fetchNews(countryCode: (bridging?.countryCode ?? "id").lowercased())
    }
    
    func toHistory() {
        router.navigateToHistory()
    }
    
    func successFetchNews(_ articles: [Article]?) {
        // TODO: - handle present data from here
        print("<-> article count: \(articles?.count ?? 0)")
    }
    
    func failedFetchNews(_ error: CustomError) {
        // TODO: - handle error
        print("<-> failed to get news")
    }
}

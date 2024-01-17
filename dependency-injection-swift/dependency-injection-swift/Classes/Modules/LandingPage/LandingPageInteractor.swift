//  
//  LandingPageInteractor.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation

class LandingPageInteractor: ILandingPageInteractor {
    private let service: ILandingPageService
    weak var presenter: ILandingPagePresenter?
    
    init(service: ILandingPageService) {
        self.service = service
    }

    func fetchHeadlineNews(countryCode: String) {
        service.fetchHeadlineNews(countryCode: countryCode) { [weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.successFetchNews(response.dataModel.articles)
            case .failure(let error):
                self?.presenter?.failedFetchNews(error)
            }
        }
    }
}

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
    weak var view: ILandingPageViewController?
    
    init(interactor: ILandingPageInteractor, router: ILandingPageRouter, parameters: [String: Any]?) {
        self.interactor = interactor
        self.router = router
        self.parameters = parameters
    }
    
    func viewDidLoad(view: ILandingPageViewController) {
        self.view = view
    }
    
    func toHistory() {
        router.navigateToHistory()
    }
}

//  
//  HistoryPagePresenter.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation

class HistoryPagePresenter: IHistoryPagePresenter {
    private let interactor: IHistoryPageInteractor
    private let router: IHistoryPageRouter
    private let parameters: [String: Any]?
    weak var view: IHistoryPageViewController?
    
    init(interactor: IHistoryPageInteractor, router: IHistoryPageRouter, parameters: [String: Any]?) {
        self.interactor = interactor
        self.router = router
        self.parameters = parameters
    }
    
    func viewDidLoad(view: IHistoryPageViewController) {
        self.view = view
    }
    //TODO: - add your code here
}

//  
//  HistoryPageModule.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit

class HistoryPageModule: IHistoryPageModule {
    
    private let appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }
    
    func displayPage(parameters: [String : Any]) {
        let interactor = HistoryPageInteractor()
        let router = HistoryPageRouter()
        let presenter = HistoryPagePresenter(interactor: interactor, router: router, parameters: parameters)
        let viewController = HistoryPageViewController(presenter: presenter)
        router.viewController = viewController
        interactor.presenter = presenter
        appRouter.pushView(viewController, animated: true)
    }
}

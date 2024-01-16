//  
//  LandingPageModule.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit

class LandingPageModule: ILandingPageModule {
    private let appRouter: IAppRouter
    
    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }
    
    func displayPage(parameters: [String : Any]) {
        let interactor = LandingPageInteractor()
        let router = LandingPageRouter(appRouter: appRouter)
        let presenter = LandingPagePresenter(interactor: interactor, router: router, parameters: parameters)
        let viewController = LandingPageViewController(presenter: presenter)
        interactor.presenter = presenter
        appRouter.setViewControllerToStack(viewController)
    }
}

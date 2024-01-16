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
    
    func displayPage(parameters: [String : Any]?) {
        guard let view = appRouter.resolver.resolve(LandingPageViewController.self, arguments: appRouter, parameters) else { fatalError("cant resolve landing page") }
        appRouter.setViewControllerToStack(view)
    }
}

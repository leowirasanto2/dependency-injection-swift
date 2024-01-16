//  
//  LandingPageRouter.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit

class LandingPageRouter: ILandingPageRouter {
    private let appRouter: IAppRouter
    
    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func navigateToHistory() {
        appRouter.presentModule(PageModule.history, parameters: [:])
    }
}

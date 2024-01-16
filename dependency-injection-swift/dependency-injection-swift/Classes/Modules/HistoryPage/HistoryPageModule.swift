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
    
    func displayPage(parameters: [String : Any]?) {
        guard let view = appRouter.resolver.resolve(HistoryPageViewController.self, arguments: appRouter, parameters) else { fatalError("cant resolve landing page") }
        appRouter.pushView(view, animated: true)
    }
}

//  
//  NewsDetailPageModule.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 18/01/24.
//
//  Template author: leowirasanto

import Foundation
import UIKit

class NewsDetailPageModule: INewsDetailPageModule {
    private let appRouter: IAppRouter
    
    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }
    
    func displayPage(parameters: [String : Any]?) {
        guard let view = appRouter.resolver.resolve(NewsDetailPageViewController.self, arguments: appRouter, parameters) else { fatalError("cant resolve news detail page") }
        appRouter.pushView(view, animated: true)
    }
}

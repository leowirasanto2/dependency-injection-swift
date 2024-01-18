//
//  NewsDetailPageAssembly.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 18/01/24.
//

import Foundation
import Swinject

class NewsDetailPageAssembly: Assembly {
    func assemble(container: Container) {
        // MODULE
        container.register(NewsDetailPageModule.self) { (resolver, appRouter: IAppRouter) in
            return NewsDetailPageModule(appRouter: appRouter)
        }
        
        // INTERACTOR
        container.register(NewsDetailPageInteractor.self) { (_) in
            return NewsDetailPageInteractor()
        }
        
        // ROUTER
        container.register(NewsDetailPageRouter.self) { (resolver, appRouter: IAppRouter) in
            return NewsDetailPageRouter(appRouter: appRouter)
        }
        
        // PRESENTER
        container.register(NewsDetailPagePresenter.self) { (resolver, bridging: IBridging?, interactor: NewsDetailPageInteractor, router: NewsDetailPageRouter, param: [String: Any]?) in
            return NewsDetailPagePresenter(bridging: bridging, interactor: interactor, router: router, parameters: param)
        }
        
        // VIEW
        container.register(NewsDetailPageViewController.self) { (resolver, appRouter: IAppRouter, param: [String: Any]?) in
            guard let interactor = resolver.resolve(NewsDetailPageInteractor.self) else { fatalError("cant resolve interactor") }
            guard let router = resolver.resolve(NewsDetailPageRouter.self, argument: appRouter) else { fatalError("cant resolve router") }
            guard let presenter = resolver.resolve(NewsDetailPagePresenter.self, arguments: appRouter.bridging, interactor, router, param) else { fatalError("cant resolve presenter") }
            interactor.presenter = presenter
            return NewsDetailPageViewController(presenter: presenter)
        }
    }
}


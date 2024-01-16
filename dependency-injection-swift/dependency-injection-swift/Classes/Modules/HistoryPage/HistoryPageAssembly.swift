//
//  HistoryPageAssembly.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation
import Swinject

class HistoryPageAssembly: Assembly {
    func assemble(container: Container) {
        // MODULE
        container.register(HistoryPageModule.self) { (resolver, appRouter: IAppRouter) in
            return HistoryPageModule(appRouter: appRouter)
        }
        
        // INTERACTOR
        container.register(HistoryPageInteractor.self) { (_) in
            return HistoryPageInteractor()
        }
        
        // ROUTER
        container.register(HistoryPageRouter.self) { (resolver, appRouter: IAppRouter) in
            return HistoryPageRouter(appRouter: appRouter)
        }
        
        // PRESENTER
        container.register(HistoryPagePresenter.self) { (resolver, interactor: HistoryPageInteractor, router: HistoryPageRouter, param: [String: Any]?) in
            return HistoryPagePresenter(interactor: interactor, router: router, parameters: param)
        }
        
        // VIEW
        container.register(HistoryPageViewController.self) { (resolver, appRouter: IAppRouter, param: [String: Any]?) in
            guard let interactor = resolver.resolve(HistoryPageInteractor.self) else { fatalError("cant resolve interactor") }
            guard let router = resolver.resolve(HistoryPageRouter.self, argument: appRouter) else { fatalError("cant resolve router") }
            guard let presenter = resolver.resolve(HistoryPagePresenter.self, arguments: interactor, router, param) else { fatalError("cant resolve presenter") }
            interactor.presenter = presenter
            return HistoryPageViewController(presenter: presenter)
        }
    }
}


//
//  LandingPageAssembly.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation
import Swinject

class LandingPageAssembly: Assembly {
    func assemble(container: Container) {
        // MODULE
        container.register(LandingPageModule.self) { (resolver, appRouter: IAppRouter) in
            return LandingPageModule(appRouter: appRouter)
        }
        
        // INTERACTOR
        container.register(LandingPageInteractor.self) { (resolver, appRouter: IAppRouter) in
            guard let service = resolver.resolve(LandingPageService.self, argument: appRouter) else { fatalError("cant resolve service") }
            return LandingPageInteractor(service: service)
        }
        
        // ROUTER
        container.register(LandingPageRouter.self) { (resolver, appRouter: IAppRouter) in
            return LandingPageRouter(appRouter: appRouter)
        }
        
        // PRESENTER
        container.register(LandingPagePresenter.self) { (resolver, bridging: IBridging?, interactor: LandingPageInteractor, router: LandingPageRouter, param: [String: Any]?) in
            return LandingPagePresenter(bridging: bridging, interactor: interactor, router: router, parameters: param)
        }
        
        // SERVICE
        container.register(LandingPageService.self) { (resolver, appRouter: IAppRouter) in
            guard let service = resolver.resolve(APIService.self, argument: appRouter) else { fatalError("cant resolve service") }
            return LandingPageService(apiService: service)
        }
        
        // VIEW
        container.register(LandingPageViewController.self) { (resolver, appRouter: IAppRouter, param: [String: Any]?) in
            guard let interactor = resolver.resolve(LandingPageInteractor.self, argument: appRouter) else { fatalError("cant resolve interactor") }
            guard let router = resolver.resolve(LandingPageRouter.self, argument: appRouter) else { fatalError("cant resolve router") }
            guard let presenter = resolver.resolve(LandingPagePresenter.self, arguments: appRouter.bridging, interactor, router, param) else { fatalError("cant resolve presenter") }
            interactor.presenter = presenter
            return LandingPageViewController(presenter: presenter)
        }
    }
}

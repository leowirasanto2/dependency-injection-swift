//
//  ModuleFactory.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation
import UIKit
import Swinject

class ModuleFactory: ProductRouter {
    private var appRouter: IAppRouter
    
    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }
    
    var modules: [String: BaseModule] {
        var result: [String: BaseModule] = [:]
        
        if let landingModule = appRouter.resolver.resolve(LandingPageModule.self, argument: appRouter) {
            result[PageModule.landing.moduleKey] = landingModule
        }
        
        if let historyModule = appRouter.resolver.resolve(HistoryPageModule.self, argument: appRouter) {
            result[PageModule.history.moduleKey] = historyModule
        }
        
        return result
    }
    
    func presentModule(_ module: Module, parameters: [String : Any]) {
        if let module = modules[module.moduleKey] {
            module.displayPage(parameters: parameters)
        }
    }
    
    static func getAssemblies() -> [Assembly] {
        var result: [Assembly] = [
            LandingPageAssembly(),
            HistoryPageAssembly()
        ]
        
        return result
    }
}

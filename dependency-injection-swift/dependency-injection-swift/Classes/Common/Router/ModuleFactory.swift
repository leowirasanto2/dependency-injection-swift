//
//  ModuleFactory.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation
import UIKit

class ModuleFactory: ProductRouter {
    private var appRouter: IAppRouter
    
    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }
    
    var modules: [String: BaseModule] {
        var result: [String: BaseModule] = [:]
        let landingModule = LandingPageModule(appRouter: appRouter)
        let historyModule = HistoryPageModule(appRouter: appRouter)
        
        result[PageModule.landing.moduleKey] = landingModule
        result[PageModule.history.moduleKey] = historyModule
        return result
    }
    
    func presentModule(_ module: Module, parameters: [String : Any]) {
        if let module = modules[module.moduleKey] {
            module.displayPage(parameters: parameters)
        }
    }
}

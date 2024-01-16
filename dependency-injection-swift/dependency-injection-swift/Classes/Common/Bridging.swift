//
//  Configuration.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation

protocol IBridging: AnyObject {
    
}

class Bridging: IBridging {
    var appRouter: IAppRouter
    
    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }
}

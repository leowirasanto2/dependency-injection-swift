//
//  CommonAssembler.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation
import Swinject

class CommonAssembler: Assembly {
    func assemble(container: Container) {
        container.register(Bridging.self) { r in
            return Bridging()
        }
        
        container.register(APIService.self) { (r, appRouter: IAppRouter) in
            return DefaultAPIService(baseUrl: appRouter.bridging?.baseUrl ?? "")
        }
    }
}

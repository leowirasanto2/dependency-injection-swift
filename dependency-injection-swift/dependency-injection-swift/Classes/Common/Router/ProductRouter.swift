//
//  ProductRouter.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation

protocol Module {
    var moduleKey: String { get }
}

protocol ProductRouter: AnyObject {
    func presentModule(_ module: Module, parameters: [String: Any])
}

enum PageModule: Module {
    case landing
    case history
    case newsDetail
    
    var moduleKey: String {
        switch self {
        case .landing:
            return "landing-page-key"
        case .history:
            return "history-page-key"
        case .newsDetail:
            return "news-detail-page-key"
        }
    }
}

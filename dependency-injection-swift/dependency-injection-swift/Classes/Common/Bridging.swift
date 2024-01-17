//
//  Configuration.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation

protocol IBridging: AnyObject {
    var baseUrl: String { get }
    var countryCode: String { get }
}

class Bridging: IBridging {
    
    var baseUrl: String {
        return "https://newsapi.org"
    }
    
    var countryCode: String {
        return ((Locale.current as NSLocale).object(forKey: .countryCode) as? String) ?? "id"
    }
    
    init() {}
}

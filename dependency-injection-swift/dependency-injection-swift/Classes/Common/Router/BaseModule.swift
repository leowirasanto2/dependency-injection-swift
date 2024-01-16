//
//  BaseModule.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 16/01/24.
//

import Foundation

protocol BaseModule: AnyObject {
    func displayPage(parameters: [String: Any]?)
}

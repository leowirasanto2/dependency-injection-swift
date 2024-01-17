//
//  APIRequest.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation

struct APIRequest {
    var endPoint: String
    var parameters: [String: String]?
    var keyCodingStrategy: JSONDecoder.KeyDecodingStrategy
    
    init(endPoint: String, parameters: [String : String]? = nil, keyCodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase) {
        self.endPoint = endPoint
        self.parameters = parameters
        self.keyCodingStrategy = keyCodingStrategy
    }
}

//
//  DictionaryExtension.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation

extension Dictionary {
    var queryString: String {
        var output: String = "?"
        guard !self.isEmpty else { return "" }
        
        for (key, value) in self {
            output += "\(key)=\(value)&"
        }
        
        return String(output.dropLast())
            .replacingOccurrences(of: " ", with: "%20")
    }
}

extension Dictionary where Key == String {
    var toPrettyJson: String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return String(data: jsonData, encoding: .ascii)
        }
        return nil
    }
}

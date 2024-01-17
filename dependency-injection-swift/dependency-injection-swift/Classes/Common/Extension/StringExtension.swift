//
//  StringExtension.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation

extension String {
    func formatedStringDate(originalFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ", _ expectedFormat: String = "MMMM d, yyyy - h:mm a") -> String {
        let localeIdentifier = ((Locale.current as NSLocale).object(forKey: .identifier) as? String) ?? "en_US"
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        dateFormatter.dateFormat = originalFormat
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = expectedFormat
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}

//
//  NewsData.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation

// MARK: - NewsResponse
struct NewsData: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Decodable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String?
}

//
//  NewsResponse.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleResponse]?
    
    var dataModel: NewsData {
        return NewsData(
            status: self.status,
            totalResults: self.totalResults,
            articles: self.articles?.compactMap { $0.dataModel }
        )
    }
}

// MARK: - Article
struct ArticleResponse: Decodable {
    let source: SourceResponse?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var dataModel: Article {
        return Article(
            source: self.source?.dataModel,
            author: self.author,
            title: self.title,
            description: self.description,
            url: self.url,
            urlToImage: self.urlToImage,
            publishedAt: self.publishedAt,
            content: self.content
        )
    }
}

// MARK: - Source
struct SourceResponse: Decodable {
    let id: String?
    let name: String?
    
    var dataModel: Source {
        return Source(id: self.id, name: self.name)
    }
}

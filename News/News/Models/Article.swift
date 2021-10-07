//
//  Article.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import Foundation

// MARK: - Response -

struct Response<T: Codable>: Codable {
    
    let status: String
    let totalResults: Int
    let articles: [T]
    
}

// MARK: - Article -

struct Article: Codable, Identifiable {
    
    var id: String {
        url
    }
    
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
}

// MARK: - Source -

struct Source: Codable {
    
    let id: String?
    let name: String
    
}

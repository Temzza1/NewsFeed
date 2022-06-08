//
//  NewsData.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/5/22.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String
    let page, totalPages, pageSize: Int?
    let articles: [Article]?
    let userInput: UserInput
    
    enum CodingKeys: String, CodingKey {
            case status
            case page
            case totalPages = "total_pages"
            case pageSize = "page_size"
            case articles
            case userInput = "user_input"
        }
}

// MARK: - Article
struct Article: Codable {
    let title, author, publishedDate, publishedDatePrecision: String?
    let link: String?
    let cleanURL, excerpt, summary, rights: String?
    let rank: Int?
    let topic, country, language: String?
    let media: String
    let isOpinion: Bool?
    let twitterAccount: String?
    let score: Double?
    let id: String?
    
    enum CodingKeys: String, CodingKey {
           case title, author
           case publishedDate = "published_date"
           case publishedDatePrecision = "published_date_precision"
           case link
           case cleanURL = "clean_url"
           case excerpt, summary, rights, rank, topic, country, language, media
           case isOpinion = "is_opinion"
           case twitterAccount = "twitter_account"
           case score = "_score"
           case id = "_id"
       }
}

// MARK: - UserInput
struct UserInput: Codable {
    let q: String?
    let searchIn: [String]?
    let lang: [String]?
    let from: String
    let page, size: Int?
    let sortBy: String?
    let sources: String?
    let topic: String?
    
    enum CodingKeys: String, CodingKey {
        case q
        case searchIn = "search_in"
        case lang
        case from
        case sortBy = "sort_by"
        case page, size, sources
        case topic
    }
}

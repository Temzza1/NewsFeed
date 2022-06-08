//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa


class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    var newsData = BehaviorRelay<[Article]>(value: [])
    
    func fetchNews(query: String, topic: NewsTopic) {
        let headers: HTTPHeaders = [
            "x-api-key": "\(Keys.key)",
        ]
        let url = "https://api.newscatcherapi.com/v2/search?q=\(query)&page_size=1&topic=\(topic)&lang=en"
//        let url = "https://api.newscatcherapi.com/v2/search?q=\(query)&page_size=1&topic=tech&lang=en"
        AF.request(url, headers: headers).responseDecodable(of: NewsData.self) { response in
            switch response.result {
            case .success(let result):
                print(result.articles?.first?.topic ?? "gg")
                print(result.articles?.first?.title ?? "ggg")
                print(url)
            case.failure(let error):
                print(error)
                print(url)
            }
        }
    }
    
    
}

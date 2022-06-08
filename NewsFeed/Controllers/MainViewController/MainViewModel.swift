//
//  MainViewModel.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit

class MainViewModel {
    
    let networkManager = NetworkManager.shared
    
    func fetchNews(with quary: String, topic: NewsTopic) {
        networkManager.fetchNews(query: quary, topic: topic)
    }
    
}

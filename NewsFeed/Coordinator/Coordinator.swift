//
//  Coordinator.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit

enum Event {
    case openMainController
    case openSecondController
}

protocol Coordinator {
    
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator]? { get set }
    
    func eventHappended(with type: Event)
    func start()
}

protocol Coordinating: AnyObject {
    var coordinator: Coordinator? { get set }
}

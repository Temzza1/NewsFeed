//
//  AppCoordinator.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    var children: [Coordinator]? = nil
    
    func eventHappended(with type: Event) {
        switch type {
        case .openMainController:
            openMainController()
        case .openSecondController:
            openSecondController()
        }
        
    }
    
    func chooseSideForOpen(to vc: UIViewController, from: CATransitionSubtype) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push
        transition.subtype = from
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func start() {
        let vc: UIViewController & Coordinating = MainViewConroller()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func openMainController() {
        let vc: UIViewController & Coordinating = MainViewConroller()
        vc.coordinator = self
        self.chooseSideForOpen(to: vc, from: .fromLeft)
    }
    
    func openSecondController() {
        let vc: UIViewController & Coordinating = SecondViewController()
        vc.coordinator = self
        self.chooseSideForOpen(to: vc, from: .fromRight)
    }
    
    
    
    
}

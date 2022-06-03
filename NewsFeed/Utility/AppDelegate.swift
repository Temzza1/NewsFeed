//
//  AppDelegate.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navVC = UINavigationController()
        navVC.navigationBar.isHidden = true
        let coordinator = AppCoordinator()
        coordinator.navigationController = navVC
    
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
        coordinator.start()
        
        return true
    }


}


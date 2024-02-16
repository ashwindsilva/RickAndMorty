//
//  DashboardFactory.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import UIKit

protocol DashboardFactoryProtocol {
    func makeDashboardViewController(with viewControllers: [UIViewController]) -> DashboardViewController
    func makeCharactersNavigationController() -> UINavigationController
    func makeLocationsNavigationController() -> UINavigationController
    func makeEpisodesNavigationController() -> UINavigationController
}

struct DashboardFactory: DashboardFactoryProtocol {
    func makeDashboardViewController(with viewControllers: [UIViewController]) -> DashboardViewController {
        let dashboardViewController = DashboardViewController()
        dashboardViewController.viewControllers = viewControllers
        return dashboardViewController
    }
    
    func makeCharactersNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(
            title: Tab.characters.title,
            image: UIImage(systemName: Tab.characters.imageName),
            tag: Tab.characters.hashValue
        )
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
    
    func makeLocationsNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(
            title: Tab.locations.title,
            image: UIImage(systemName: Tab.locations.imageName),
            tag: Tab.locations.hashValue
        )
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
    
    func makeEpisodesNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(
            title: Tab.episodes.title,
            image: UIImage(systemName: Tab.episodes.imageName),
            tag: Tab.episodes.hashValue
        )
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}

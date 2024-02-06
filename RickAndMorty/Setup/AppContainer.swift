//
//  AppContainer.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class AppContainer {
    
    // MARK: - Methods
    
    func makeDashboardViewController() -> DashboardViewController {
        let dashboardViewController = DashboardViewController()
        let childCoordinators: [NavigationCoordinator] = [
            CharactersCoordinator(appContainer: self),
            LocationsCoordinator(appContainer: self),
            EpisodesCoordinator(appContainer: self)
        ]
        
        dashboardViewController.viewControllers = childCoordinators.map { childCoordinator in
            childCoordinator.navigationController
        }
        
        childCoordinators.forEach { childCoordinator in
            childCoordinator.start()
        }
        
        return dashboardViewController
    }
    
    func makeCharactersViewController() -> CharactersViewController {
        let charactersViewController = CharactersViewController(viewModel: .init())
        charactersViewController.title = Tab.characters.title
        
        return charactersViewController
    }
    
    func makeLocationsViewController() -> LocationsViewController {
        let locationsViewController = LocationsViewController()
        locationsViewController.title = Tab.locations.title
    
        return locationsViewController
    }
    
    func makeEpisodesViewController() -> EpisodesViewController {
        let episodesViewController = EpisodesViewController()
        episodesViewController.title = Tab.episodes.title
        
        return episodesViewController
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

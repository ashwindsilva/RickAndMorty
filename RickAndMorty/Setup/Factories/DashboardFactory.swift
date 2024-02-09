//
//  DashboardFactory.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import UIKit

protocol DashboardFactoryProtocol {
    func makeDashboardViewController(
        charactersFactory: CharactersFactoryProtocol,
        locationsFactory: LocationsFactoryProtocol,
        episodesFactory: EpisodesFactoryProtocol
    ) -> DashboardViewController
    func makeCharactersNavigationController() -> UINavigationController
    func makeLocationsNavigationController() -> UINavigationController
    func makeEpisodesNavigationController() -> UINavigationController
}

struct DashboardFactory: DashboardFactoryProtocol {
    func makeDashboardViewController(
        charactersFactory: CharactersFactoryProtocol,
        locationsFactory: LocationsFactoryProtocol,
        episodesFactory: EpisodesFactoryProtocol
    ) -> DashboardViewController {
        let dashboardViewController = DashboardViewController()
        let childCoordinators: [NavigationCoordinator] = [
            CharactersCoordinator(
                navigationController: makeCharactersNavigationController(),
                charactersFactory: charactersFactory
            ),
            LocationsCoordinator(
                navigationController: makeLocationsNavigationController(),
                locationsFactory: locationsFactory
            ),
            EpisodesCoordinator(
                navigationController: makeEpisodesNavigationController(),
                episodesFactory: episodesFactory
            )
        ]
        
        dashboardViewController.viewControllers = childCoordinators.map { childCoordinator in
            childCoordinator.navigationController
        }
        
        childCoordinators.forEach { childCoordinator in
            childCoordinator.start()
        }
        
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

//
//  DashboardCoordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class DashboardCoordinator: Coordinator {
    typealias Dependency = NetworkProvider & ImageCacheProvider
    
    // MARK: - Properties
    
    private let window: UIWindow
    private let dependency: Dependency
    private var coordinators: [NavigationCoordinator] = []
    
    // MARK: - Init
    
    init(window: UIWindow, dependency: Dependency) {
        self.window = window
        self.dependency = dependency
    }
    
    // MARK: - Methods
    
    func start() {
        let dashboardFactory = DashboardFactory()
        
        let charactersCoordinator = CharactersCoordinator(
            navigationController: dashboardFactory.makeCharactersNavigationController(),
            charactersFactory: CharactersFactory(dependency: dependency)
        )
        
        let locationsCoordinator = LocationsCoordinator(
            navigationController: dashboardFactory.makeLocationsNavigationController(),
            locationsFactory: LocationsFactory()
        )
        
        let episodesCoordinator = EpisodesCoordinator(
            navigationController: dashboardFactory.makeEpisodesNavigationController(),
            episodesFactory: EpisodesFactory()
        )
        
        coordinators = [charactersCoordinator, locationsCoordinator, episodesCoordinator]
        
        window.rootViewController = dashboardFactory.makeDashboardViewController(
            with: coordinators.map { $0.navigationController }
        )
        window.makeKeyAndVisible()
        
        coordinators.forEach { $0.start() }
    }
}

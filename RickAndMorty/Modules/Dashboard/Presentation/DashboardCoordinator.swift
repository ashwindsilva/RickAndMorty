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
    
    // MARK: - Init
    
    init(window: UIWindow, dependency: Dependency) {
        self.window = window
        self.dependency = dependency
    }
    
    // MARK: - Methods
    
    func start() {
        window.rootViewController = DashboardFactory().makeDashboardViewController(
            charactersFactory: CharactersFactory(dependency: dependency),
            locationsFactory: LocationsFactory(),
            episodesFactory: EpisodesFactory()
        )
        window.makeKeyAndVisible()
    }
}

//
//  DashboardCoordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class DashboardCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow
    private let networkProvider: NetworkProvider
    
    // MARK: - Init
    
    init(window: UIWindow, networkProvider: NetworkProvider) {
        self.window = window
        self.networkProvider = networkProvider
    }
    
    // MARK: - Methods
    
    func start() {
        window.rootViewController = DashboardFactory().makeDashboardViewController(
            charactersFactory: CharactersFactory(networkProvider: networkProvider),
            locationsFactory: LocationsFactory(),
            episodesFactory: EpisodesFactory()
        )
        window.makeKeyAndVisible()
    }
}

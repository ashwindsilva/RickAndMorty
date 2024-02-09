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
    private let dashboardFactory: DashboardFactoryProtocol
    private let charactersFactory: CharactersFactoryProtocol
    private let locationsFactory: LocationsFactoryProtocol
    private let episodesFactory: EpisodesFactoryProtocol
    
    // MARK: - Init
    
    init(
        window: UIWindow,
        dashboardFactory: DashboardFactoryProtocol = DashboardFactory(),
        charactersFactory: CharactersFactoryProtocol = CharactersFactory(),
        locationsFactory: LocationsFactoryProtocol = LocationsFactory(),
        episodesFactory: EpisodesFactoryProtocol = EpisodesFactory()
    ) {
        self.window = window
        self.dashboardFactory = dashboardFactory
        self.charactersFactory = charactersFactory
        self.locationsFactory = locationsFactory
        self.episodesFactory = episodesFactory
    }
    
    // MARK: - Methods
    
    func start() {
        window.rootViewController = dashboardFactory.makeDashboardViewController(
            charactersFactory: charactersFactory,
            locationsFactory: locationsFactory,
            episodesFactory: episodesFactory
        )
        window.makeKeyAndVisible()
    }
}

//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class EpisodesCoordinator: NavigationCoordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    let episodesFactory: EpisodesFactoryProtocol
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, episodesFactory: EpisodesFactoryProtocol) {
        self.navigationController = navigationController
        self.episodesFactory = episodesFactory
    }
    
    // MARK: - Methods
    
    func start() {
        let episodesViewController = episodesFactory.makeEpisodesViewController()
        navigationController.pushViewController(episodesViewController, animated: false)
    }
}

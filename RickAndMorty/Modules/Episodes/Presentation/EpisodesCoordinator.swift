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
    let appContainer: AppContainer
    
    // MARK: - Init
    
    init(appContainer: AppContainer) {
        self.navigationController = appContainer.makeEpisodesNavigationController()
        self.appContainer = appContainer
    }
    
    // MARK: - Methods
    
    func start() {
        let episodesViewController = appContainer.makeEpisodesViewController()
        navigationController.pushViewController(episodesViewController, animated: false)
    }
}

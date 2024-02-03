//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class CharactersCoordinator: NavigationCoordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    let appContainer: AppContainer
    
    // MARK: - Init
    
    init(appContainer: AppContainer) {
        self.navigationController = appContainer.makeCharactersNavigationController()
        self.appContainer = appContainer
    }
    
    // MARK: - Methods
    
    func start() {
        let charactersViewController = appContainer.makeCharactersViewController()
        navigationController.pushViewController(charactersViewController, animated: false)
    }
}

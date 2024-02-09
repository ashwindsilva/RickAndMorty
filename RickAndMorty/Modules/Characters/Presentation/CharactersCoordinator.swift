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
    let charactersFactory: CharactersFactoryProtocol
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, charactersFactory: CharactersFactoryProtocol) {
        self.navigationController = navigationController
        self.charactersFactory = charactersFactory
    }
    
    // MARK: - Methods
    
    func start() {
        let charactersViewController = charactersFactory.makeCharactersViewController()
        navigationController.pushViewController(charactersViewController, animated: false)
    }
}

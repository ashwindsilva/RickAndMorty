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
        charactersViewController.delegate = self
        navigationController.pushViewController(charactersViewController, animated: false)
    }
    
    func pushCharacterDetailViewController(for character: Character) {
        let viewController = charactersFactory.makeCharacterDetailViewController(for: character)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - CharactersViewControllerDelegate

extension CharactersCoordinator: CharactersViewControllerDelegate {
    func didSelectCharacter(_ character: Character) {
        pushCharacterDetailViewController(for: character)
    }
}

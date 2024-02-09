//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Foundation

protocol CharactersFactoryProtocol {
    func makeCharactersViewController() -> CharactersViewController
}

struct CharactersFactory: CharactersFactoryProtocol {
    func makeCharactersViewController() -> CharactersViewController {
        let charactersViewController = CharactersViewController(viewModel: .init())
        charactersViewController.title = Tab.characters.title
        
        return charactersViewController
    }
}

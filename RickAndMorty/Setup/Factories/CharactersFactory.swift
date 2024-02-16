//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Foundation

protocol CharactersFactoryProtocol {
    func makeCharactersViewController() -> CharactersViewController
    func makeCharacterDetailViewController(for character: Character) -> CharacterDetailViewController
}

protocol CharacterViewModelFactory {
    func make(character: Character) -> CharacterViewModel
}

struct CharactersFactory: CharactersFactoryProtocol {
    // MARK: - Types
    
    typealias Dependency = NetworkProvider & ImageCacheProvider
    
    // MARK: - Properties
    
    let dependency: Dependency
    
    // MARK: - Methods
    
    func makeCharactersViewController() -> CharactersViewController {
        let dataSource = CharacterNetworkDataSource(
            networkService: dependency.networkService,
            jsonDecoder: dependency.jsonDecoder
        )
        let repository = CharacterRepository(dataSource: dataSource)
        let getCharactersUseCase = GetCharactersUseCase(repository: repository)
        let viewModel = CharactersViewModel(getCharactersUseCase: getCharactersUseCase, characterViewModelFactory: self)
        
        let charactersViewController = CharactersViewController(viewModel: viewModel)
        charactersViewController.title = Tab.characters.title
        
        return charactersViewController
    }
    
    func makeCharacterDetailViewController(for character: Character) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController(
            viewModel: .init(character: character)
        )
        return viewController
    }
}

// MARK: - CharacterViewModelFactory

extension CharactersFactory: CharacterViewModelFactory {
    func make(character: Character) -> CharacterViewModel {
        let dataSource = NetworkImageDataSource(
            networkService: dependency.networkService,
            cache: dependency.imageCache
        )
        let imageDataRepository = ImageDataRepository(datasource: dataSource)
        let getImageDataUseCase = GetImageDataUseCase(repository: imageDataRepository)
        
        return CharacterViewModel.init(
            character: character,
            getImageDataUseCase: getImageDataUseCase
        )
    }
}

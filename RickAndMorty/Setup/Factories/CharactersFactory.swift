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

protocol CharacterImageTableViewCellViewModelFactory {
    func make(character: Character) -> CharacterImageTableViewCellViewModel
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
        let viewModel = makeCharacterDetailViewModel(for: character)
        let viewController = CharacterDetailViewController(viewModel: viewModel)
        
        return viewController
    }
    
    private func makeCharacterDetailViewModel(for character: Character) -> CharacterDetailViewModel {
        return .init(character: character, factory: self)
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

// MARK: - CharacterImageTableViewCellViewModelFactory

extension CharactersFactory: CharacterImageTableViewCellViewModelFactory {
    func make(character: Character) -> CharacterImageTableViewCellViewModel {
        let dataSource = NetworkImageDataSource(
            networkService: dependency.networkService,
            cache: dependency.imageCache
        )
        let imageDataRepository = ImageDataRepository(datasource: dataSource)
        let getImageDataUseCase = GetImageDataUseCase(repository: imageDataRepository)
        
        return .init(
            character: character,
            getImageDataUseCase: getImageDataUseCase
        )
    }
}

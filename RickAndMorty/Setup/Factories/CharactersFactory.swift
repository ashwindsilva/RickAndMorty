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

protocol CharacterViewModelFactory {
    func make(character: Character) -> CharacterViewModel
}

struct CharactersFactory: CharactersFactoryProtocol {
    let networkProvider: NetworkProvider
    
    func makeCharactersViewController() -> CharactersViewController {
        let dataSource = CharacterNetworkDataSource(
            networkService: networkProvider.networkService,
            jsonDecoder: networkProvider.jsonDecoder
        )
        let repository = CharacterRepository(dataSource: dataSource)
        let getCharactersUseCase = GetCharactersUseCase(repository: repository)
        let viewModel = CharactersViewModel(getCharactersUseCase: getCharactersUseCase, characterViewModelFactory: self)
        
        let charactersViewController = CharactersViewController(viewModel: viewModel)
        charactersViewController.title = Tab.characters.title
        
        return charactersViewController
    }
}

// MARK: - CharacterViewModelFactory

extension CharactersFactory: CharacterViewModelFactory {
    func make(character: Character) -> CharacterViewModel {
        let dataSource = NetworkImageDataSource(networkService: networkProvider.networkService)
        let imageDataRepository = ImageDataRepository(datasource: dataSource)
        let getImageDataUseCase = GetImageDataUseCase(repository: imageDataRepository)
        
        return CharacterViewModel.init(
            character: character,
            getImageDataUseCase: getImageDataUseCase
        )
    }
}

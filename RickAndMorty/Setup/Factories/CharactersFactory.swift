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
    let networkProvider: NetworkProvider
    
    func makeCharactersViewController() -> CharactersViewController {
        let dataSource = CharacterNetworkDataSource(
            networkService: networkProvider.networkService,
            jsonDecoder: networkProvider.jsonDecoder
        )
        let repository = CharacterRepository(dataSource: dataSource)
        let getCharactersUseCase = GetCharactersUseCase(repository: repository)
        let viewModel = CharactersViewModel(getCharactersUseCase: getCharactersUseCase)

        let charactersViewController = CharactersViewController(viewModel: viewModel)
        charactersViewController.title = Tab.characters.title
        
        return charactersViewController
    }
}

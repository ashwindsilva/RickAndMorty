//
//  CharacterNetworkDataSource.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

struct CharacterNetworkDataSource: CharacterDataSourceProtocol {
    let networkService: NetworkService
    let jsonDecoder: JSONDecoder
    
    func getCharacters() -> AnyPublisher<CharacterListDTO, CharacterDataSourceError> {
        let url = URL(string: "https://rickandmortyapi.com/api/character")! // TODO: construct url
        
        return networkService
            .request(url)
            .mapError { CharacterDataSourceError.network($0) }
            .decode(type: CharacterListDTO.self, decoder: jsonDecoder)
            .mapError { CharacterDataSourceError.decoding($0) }
            .eraseToAnyPublisher()
    }
}

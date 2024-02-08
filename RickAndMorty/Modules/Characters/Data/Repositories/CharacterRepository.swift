//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

struct CharacterRepository: CharacterRepositoryProtocol {
    let dataSource: CharacterDataSourceProtocol
    
    func getCharacters() -> AnyPublisher<CharacterList, CharacterRepositoryError> {
        dataSource
            .getCharacters()
            .mapError { CharacterRepositoryError.dataSource($0) }
            .map { CharacterRepositoryMapper.map($0) }
            .eraseToAnyPublisher()
    }
}

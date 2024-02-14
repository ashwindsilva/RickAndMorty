//
//  CharacterRepositoryProtocol.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

enum CharacterRepositoryError: Error {
    case dataSource(Error)
    case decoding(Error)
}

protocol CharacterRepositoryProtocol {
    func getCharacters(at page: Int) -> AnyPublisher<CharacterList, CharacterRepositoryError>
}

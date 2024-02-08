//
//  CharacterDataSourceProtocol.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

enum CharacterDataSourceError: Error {
    case network(Error)
    case decoding(Error)
}

protocol CharacterDataSourceProtocol {
    func getCharacters() -> AnyPublisher<CharacterListDTO, CharacterDataSourceError>
}

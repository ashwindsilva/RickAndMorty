//
//  CharactersDataSourceProtocol.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

enum CharactersDataSourceError: Error {
    
}

protocol CharactersDataSourceProtocol {
    func getCharacters() async -> AnyPublisher<CharacterListDTO, CharactersDataSourceError>
}

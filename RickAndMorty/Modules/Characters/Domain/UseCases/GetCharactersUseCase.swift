//
//  GetCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Combine
import Foundation

enum GetCharactersUseCaseError: Error {
    case repository(Error)
}

protocol GetCharactersUseCaseProtocol {
    func execute(page: Int) -> AnyPublisher<CharacterList, GetCharactersUseCaseError>
}

struct GetCharactersUseCase: GetCharactersUseCaseProtocol {
    let repository: CharacterRepositoryProtocol
    
    func execute(page: Int) -> AnyPublisher<CharacterList, GetCharactersUseCaseError> {
        repository.getCharacters(at: page)
            .mapError { GetCharactersUseCaseError.repository($0) }
            .eraseToAnyPublisher()
    }
}

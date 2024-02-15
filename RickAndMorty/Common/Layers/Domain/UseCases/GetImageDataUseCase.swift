//
//  GetImageDataUseCase.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Combine
import Foundation

enum GetImageDataUseCaseError: Error {
    case failure(Error)
}

protocol GetImageDataUseCaseProtocol {
    func execute(url: URL) -> AnyPublisher<Data, GetImageDataUseCaseError>
}

struct GetImageDataUseCase: GetImageDataUseCaseProtocol {
    let repository: ImageDataRepositoryProtocol
    
    func execute(url: URL) -> AnyPublisher<Data, GetImageDataUseCaseError> {
        repository.getImage(url)
            .mapError { GetImageDataUseCaseError.failure($0) }
            .eraseToAnyPublisher()
    }
}

//
//  ImageDataRepository.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Combine
import Foundation

struct ImageDataRepository: ImageDataRepositoryProtocol {
    let datasource: ImageDataSourceProtocol
    
    func getImage(_ url: URL) -> AnyPublisher<Data, ImageDataSourceError> {
        datasource.getImage(url)
            .mapError { ImageDataSourceError.datasource($0) }
            .eraseToAnyPublisher()
    }
}

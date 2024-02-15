//
//  ImageDataRepository.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Combine
import Foundation

struct ImageDataRepository<DataSource: ImageDataSourceProtocol>: ImageDataRepositoryProtocol {
    let datasource: DataSource
    
    func getImage(_ url: URL) -> AnyPublisher<Data, ImageDataRepositoryError> {
        datasource.getImage(url)
            .mapError { ImageDataRepositoryError.datasource($0) }
            .eraseToAnyPublisher()
    }
}

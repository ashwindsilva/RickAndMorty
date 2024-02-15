//
//  NetworkImageDataSource.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Combine
import Foundation

enum NetworkImageDataSourceError: Error {
    case network(Error)
}

protocol ImageDataSourceProtocol {
    func getImage(_ url: URL) -> AnyPublisher<Data, NetworkImageDataSourceError>
}

struct NetworkImageDataSource: ImageDataSourceProtocol {
    let networkService: NetworkService
    
    func getImage(_ url: URL) -> AnyPublisher<Data, NetworkImageDataSourceError> {
        networkService.request(url)
            .mapError { NetworkImageDataSourceError.network($0) }
            .eraseToAnyPublisher()
    }
}

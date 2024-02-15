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

struct NetworkImageDataSource: ImageDataSourceProtocol {
    let networkService: NetworkService
    let cache: Cache
    
    func getImage(_ url: URL) -> AnyPublisher<Data, NetworkImageDataSourceError> {
        if let data = cache.get(key: url.absoluteString) {
            return Just(data)
                .setFailureType(to: NetworkImageDataSourceError.self)
                .eraseToAnyPublisher()
        } else {
            return networkService.request(url)
                .mapError { NetworkImageDataSourceError.network($0) }
                .handleEvents(
                    receiveOutput: { data in
                        cache.save(data: data, key: url.absoluteString)
                    }
                )
                .eraseToAnyPublisher()
        }
    }
}

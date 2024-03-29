//
//  ImageDataRepositoryProtocol.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Combine
import Foundation

enum ImageDataRepositoryError: Error {
    case datasource(Error)
}

protocol ImageDataRepositoryProtocol {
    func getImage(_ url: URL) -> AnyPublisher<Data, ImageDataRepositoryError>
}

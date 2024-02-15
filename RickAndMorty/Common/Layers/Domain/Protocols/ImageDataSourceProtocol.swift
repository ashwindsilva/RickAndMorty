//
//  ImageDataSourceProtocol.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Combine
import Foundation

protocol ImageDataSourceProtocol {
    func getImage(_ url: URL) -> AnyPublisher<Data, NetworkImageDataSourceError>
}

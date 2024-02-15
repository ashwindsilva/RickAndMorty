//
//  AppContainer.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

protocol NetworkServiceProvider {
    var networkService: NetworkService { get }
}

protocol JSONDecoderProvider {
    var jsonDecoder: JSONDecoder { get }
}

protocol ImageCacheProvider {
    var imageCache: ImageCache { get }
}

typealias NetworkProvider = NetworkServiceProvider & JSONDecoderProvider

final class AppContainer: NetworkProvider, ImageCacheProvider {
    
    // MARK: - Properties
    
    let networkService: NetworkService = URLSessionNetworkService()
    let imageCache: ImageCache = .init()
    
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }()
}

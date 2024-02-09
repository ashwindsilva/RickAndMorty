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

typealias NetworkProvider = NetworkServiceProvider & JSONDecoderProvider

final class AppContainer: NetworkProvider {
    
    // MARK: - Properties
    
    let networkService: NetworkService = URLSessionNetworkService()
    
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }()
}

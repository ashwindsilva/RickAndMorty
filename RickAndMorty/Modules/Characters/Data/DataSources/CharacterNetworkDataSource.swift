//
//  CharacterNetworkDataSource.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

struct CharacterNetworkDataSource: CharacterDataSourceProtocol {
    let networkService: NetworkService
    let jsonDecoder: JSONDecoder
    
    func getCharacters(at page: Int) -> AnyPublisher<CharacterListDTO, CharacterDataSourceError> {
        let url = CharacterNetworkRequest.getCharacters(page: page).url
        
        return networkService
            .request(url)
            .mapError { CharacterDataSourceError.network($0) }
            .decode(type: CharacterListDTO.self, decoder: jsonDecoder)
            .mapError { CharacterDataSourceError.decoding($0) }
            .eraseToAnyPublisher()
    }
}

// MARK: - CharacterNetworkRequest

extension CharacterNetworkDataSource {
    enum CharacterNetworkRequest: NetworkRequest {
        case getCharacters(page: Int)
        
        var path: String { "character" }
        
        var queryItems: [URLQueryItem] {
            switch self {
            case .getCharacters(page: let page):
                return [
                    URLQueryItem(name: "page", value: String(page))
                ]
            }
        }
    }
}

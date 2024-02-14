//
//  NetworkRequest.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 13/02/24.
//

import Foundation

protocol NetworkRequest {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension NetworkRequest {
    var url: URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api"
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!.appending(path: path)
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}

//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation

enum NetworkError: Error {
    case noResponse
    case badResponse(statusCode: Int, response: URLResponse)
    case unknown(Error)
}

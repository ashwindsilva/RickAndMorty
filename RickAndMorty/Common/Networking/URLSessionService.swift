//
//  URLSessionService.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

struct URLSessionNetworkService {
    
    // MARK: - Properties
    
    let urlSession: URLSession
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // MARK: - Methods
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(_ url: URL) -> some Publisher<T, Error> {
        urlSession.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let httpURLResponse = response as? HTTPURLResponse,
                      case let statusCode = httpURLResponse.statusCode,
                      case let isSuccess = (200...300).contains(statusCode)
                else {
                    throw NetworkError.noResponse
                }
                
                guard isSuccess else {
                    throw NetworkError.badResponse(statusCode: statusCode, response: response)
                }
                
                return data
            }
            .decode(type: T.self, decoder: jsonDecoder)
            .mapError { error in
                if error is DecodingError {
                    return NetworkError.decoding(error)
                } else {
                    return NetworkError.unknown(error)
                }
            }
    }
}

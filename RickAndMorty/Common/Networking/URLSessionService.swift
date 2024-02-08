//
//  URLSessionService.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Combine
import Foundation

struct URLSessionNetworkService: NetworkService {
    
    // MARK: - Properties
    
    let urlSession: URLSession
    
    // MARK: - Methods
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request(_ url: URL) -> any Publisher<Data, NetworkError> {
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
            .mapError { error in
                return NetworkError.unknown(error)
            }
    }
}

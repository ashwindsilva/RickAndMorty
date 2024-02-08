//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T: Decodable>(_ url: URL) -> any Publisher<T, Error>
}

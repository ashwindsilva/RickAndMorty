//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation
import Combine

protocol NetworkService {
    func request(_ url: URL) -> any Publisher<Data, NetworkError>
}

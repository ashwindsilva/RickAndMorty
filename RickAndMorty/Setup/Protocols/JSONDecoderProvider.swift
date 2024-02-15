//
//  JSONDecoderProvider.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Foundation

protocol JSONDecoderProvider {
    var jsonDecoder: JSONDecoder { get }
}

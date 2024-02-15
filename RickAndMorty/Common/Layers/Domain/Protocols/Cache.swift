//
//  Cache.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Foundation

protocol Cache {
    func save(data: Data, key: String)
    func get(key: String) -> Data?
}

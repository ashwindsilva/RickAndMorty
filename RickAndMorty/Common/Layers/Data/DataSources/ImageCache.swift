//
//  ImageCache.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 15/02/24.
//

import Foundation

struct ImageCache: Cache {
    private let cache = NSCache<NSString, NSData>()
    
    func save(data: Data, key: String) {
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(key: String) -> Data? {
        cache.object(forKey: key as NSString) as? Data
    }
}

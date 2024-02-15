//
//  InfoMapper.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation

enum InfoMapper {
    static func map(_ dto: InfoDTO?) -> Info? {
        guard let dto else {
            return nil
        }
        
        return .init(
            count: dto.count,
            pages: dto.pages,
            next: .init(string: dto.next ?? .init()),
            prev: .init(string: dto.prev ?? .init())
        )
    }
}

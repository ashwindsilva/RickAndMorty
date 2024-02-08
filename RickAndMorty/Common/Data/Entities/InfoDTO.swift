//
//  InfoDTO.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation

struct InfoDTO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Mapping

extension InfoDTO {
    func toDomain() -> Info {
        .init(
            count: count,
            pages: pages,
            next: .init(string: next ?? .init()),
            prev: .init(string: prev ?? .init())
        )
    }
}

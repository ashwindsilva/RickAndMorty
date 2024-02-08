//
//  CharacterListDTO.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation

struct CharacterListDTO: Codable {
    let info: InfoDTO?
    let results: [CharacterDTO]?
}

// MARK: - Mapping

extension CharacterListDTO {
    func toDomain() -> CharacterList {
        .init(
            info: info?.toDomain(),
            results: results?.map { $0.toDomain() }
        )
    }
}


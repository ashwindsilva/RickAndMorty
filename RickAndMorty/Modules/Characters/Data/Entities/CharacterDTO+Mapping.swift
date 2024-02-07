//
//  CharacterDTO+Mapping.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 07/02/24.
//

import Foundation

// MARK: - CharacterDTO

extension CharacterDTO {
    func toDomain() -> Character {
        return Character(
            id: id,
            name: name,
            status: .init(rawValue: status ?? .init()),
            species: species,
            type: type,
            gender: .init(rawValue: gender ?? .init()),
            origin: origin?.toDomain(),
            location: location?.toDomain(),
            image: .init(string: image ?? .init()),
            episodes: episode?.compactMap { URL(string: $0) },
            url: .init(string: url ?? .init()),
            created: DateFormatter.iso8601WithFractionsFormatter.date(from: created ?? .init())
        )
    }
}

// MARK: - OriginDTO

extension CharacterDTO.OriginDTO {
    func toDomain() -> Character.Origin? {
        guard let name, let urlString = url, let url = URL(string: urlString) else {
            return nil
        }
        
        return .init(name: name, url: url)
    }
}

// MARK: - LocationDTO

extension CharacterDTO.LocationDTO {
    func toDomain() -> Character.Location? {
        guard let name, let urlString = url, let url = URL(string: urlString) else {
            return nil
        }
        
        return .init(name: name, url: url)
    }
}

//
//  CharacterMapper.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 08/02/24.
//

import Foundation

enum CharacterMapper {
    static func map(_ dto: CharacterListDTO) -> CharacterList {
        .init(
            info: InfoMapper.map(dto.info),
            results: dto.results?.map { Self.map($0) }
        )
    }
    
    static func map(_ dto: CharacterDTO) -> Character {
        .init(
            id: dto.id,
            name: dto.name,
            status: .init(rawValue: dto.status?.lowercased() ?? .init()),
            species: dto.species,
            type: dto.type,
            gender: .init(rawValue: dto.gender?.lowercased() ?? .init()),
            origin: Self.map(dto.origin),
            location: Self.map(dto.location),
            image: .init(string: dto.image ?? .init()),
            episodes: dto.episode?.compactMap { URL(string: $0) },
            url: .init(string: dto.url ?? .init()),
            created: DateFormatter.iso8601WithFractionsFormatter.date(from: dto.created ?? .init())
        )
    }
    
    private static func map(_ dto: CharacterDTO.OriginDTO?) -> Character.Origin? {
        guard let dto else {
            return nil
        }
        
        return .init(
            name: dto.name,
            url: URL(string: dto.url ?? .init())
        )
    }
    
    private static func map(_ dto: CharacterDTO.LocationDTO?) -> Character.Location? {
        guard let dto else {
            return nil
        }
        
        return .init(
            name: dto.name,
            url: URL(string: dto.url ?? .init())
        )
    }
}

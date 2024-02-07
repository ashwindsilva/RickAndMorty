//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 07/02/24.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: OriginDTO?
    let location: LocationDTO?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

extension CharacterDTO {
    struct OriginDTO: Codable {
        let name: String?
        let url: String?
    }
    
    struct LocationDTO: Codable {
        let name: String?
        let url: String?
    }
}

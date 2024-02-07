//
//  Character.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 07/02/24.
//

import Foundation

// MARK: - Character

struct Character {
    let id: Int
    let name: String?
    let status: Status?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin: Origin?
    let location: Location?
    let image: URL?
    let episodes: [URL]?
    let url: URL?
    let created: Date?
}

extension Character {
    enum Status: String {
        case alive
        case dead
        case unknown
    }
    
    enum Gender: String {
        case female
        case male
        case genderless
        case unknown
    }
    
    struct Origin {
        let name: String
        let url: URL
    }

    struct Location {
        let name: String
        let url: URL
    }
}

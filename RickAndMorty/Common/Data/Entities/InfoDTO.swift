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

//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Foundation

struct CharacterViewModel: Hashable {
    let character: Character
    
    var name: String {
        character.name ?? LocalizedStrings.na
    }
}

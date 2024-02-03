//
//  Tab.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import Foundation

enum Tab: Hashable {
    case characters
    case locations
    case episodes
    
    var title: String {
        switch self {
        case .characters:
            return LocalizedStrings.characters.capitalized
        case .locations:
            return LocalizedStrings.locations.capitalized
        case .episodes:
            return LocalizedStrings.episodes.capitalized
        }
    }
    
    var imageName: String {
        switch self {
        case .characters:
            return SFSymbols.persons2
        case .locations:
            return SFSymbols.map
        case .episodes:
            return SFSymbols.tv
        }
    }
}

//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 16/02/24.
//

import Foundation

protocol DetailRow {
    var label: String { get }
    var value: String { get }
}

final class CharacterDetailViewModel {
    
    // MARK: - Properties
    
    let character: Character
    let sections: [Section]
    let characterImageViewModel: CharacterImageTableViewCellViewModel
    
    var name: String {
        character.name ?? LocalizedStrings.na
    }
    
    // MARK: - Methods
    
    init(character: Character, factory: CharacterImageTableViewCellViewModelFactory) {
        self.character = character
        self.sections = Self.makeSections(for: character)
        self.characterImageViewModel = factory.make(character: character)
    }
    
    func title(forHeaderIn section: Int) -> String {
        return sections[section].title
    }
    
    func numberOfRows(in section: Int) -> Int {
        let section = sections[section]
        
        switch section {
        case .appearance:
            return 1
        case .info(let info):
            return info.count
        case .location(let locations):
            return locations.count
        }
    }
    
    private static func makeSections(for character: Character) -> [Section] {
        var sections: [Section] = []
        let defaultText = LocalizedStrings.na
        
        sections.append(.appearance)
        
        sections.append(.info([
            Info.status(character.status?.rawValue.capitalized ?? defaultText),
            Info.species(character.species?.capitalized ?? defaultText),
            Info.gender(character.gender?.rawValue.capitalized ?? defaultText)
        ]))
        
        sections.append(.location([
            Location.firstSeenAt(character.origin?.name?.capitalized ?? defaultText),
            Location.lastSeenAt(character.location?.name?.capitalized ?? defaultText)
        ]))
        
        return sections
    }
    
    func section(at indexPath: IndexPath) -> Section {
        return sections[indexPath.section]
    }
}

// MARK: - Data types

extension CharacterDetailViewModel {
    enum Section {
        case appearance
        case info([DetailRow])
        case location([DetailRow])
        
        var title: String {
            switch self {
            case .appearance:   return LocalizedStrings.appearance
            case .info:         return LocalizedStrings.info
            case .location:     return LocalizedStrings.location
            }
        }
    }
    
    enum Info: DetailRow {
        case status(String)
        case species(String)
        case gender(String)
        
        var label: String {
            switch self {
            case .status:   return LocalizedStrings.status.capitalized
            case .species:  return LocalizedStrings.species.capitalized
            case .gender:   return LocalizedStrings.gender.capitalized
            }
        }
        
        var value: String {
            switch self {
                
            case .status(let value):    return value
            case .species(let value):   return value
            case .gender(let value):    return value
            }
        }
    }
    
    enum Location: DetailRow {
        case firstSeenAt(String)
        case lastSeenAt(String)
        
        var label: String {
            switch self {
            case .firstSeenAt:      return LocalizedStrings.firstSeenAt.capitalized
            case .lastSeenAt(_):    return LocalizedStrings.lastSeenAt.capitalized
            }
        }
        
        var value: String {
            switch self {
                
            case .firstSeenAt(let value):   return value
            case .lastSeenAt(let value):    return value
            }
        }
    }
}

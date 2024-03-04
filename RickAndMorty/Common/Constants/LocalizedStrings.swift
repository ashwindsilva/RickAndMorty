//
//  LocalizedStrings.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import Foundation

enum LocalizedStrings {
    static let characters = NSLocalizedString("characters", comment: "characters")
    static let locations = NSLocalizedString("locations", comment: "locations")
    static let episodes = NSLocalizedString("episodes", comment: "episodes")
    
    static let noCharacters = NSLocalizedString("no characters", comment: "no characters")
    static let loadingCharacters = NSLocalizedString("loading characters", comment: "loading characters")
    
    static let na = NSLocalizedString("NA", comment: "NA")
    
    // Character detail
    static let appearance = NSLocalizedString("appearance", comment: "appearance")
    static let info = NSLocalizedString("info", comment: "info")
    static let location = NSLocalizedString("location", comment: "location")
    
    static let firstSeenAt = NSLocalizedString("first seen at", comment: "first seen at")
    static let lastSeenAt = NSLocalizedString("last seen at", comment: "last seen at")
    
    static let status = NSLocalizedString("status", comment: "status")
    static let species = NSLocalizedString("species", comment: "species")
    static let type = NSLocalizedString("type", comment: "character type")
    static let gender = NSLocalizedString("gender", comment: "gender")
}

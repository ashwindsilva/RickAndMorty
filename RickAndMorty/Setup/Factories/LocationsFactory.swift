//
//  LocationsFactory.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Foundation

protocol LocationsFactoryProtocol {
    func makeLocationsViewController() -> LocationsViewController
}

struct LocationsFactory: LocationsFactoryProtocol {
    func makeLocationsViewController() -> LocationsViewController {
        let locationsViewController = LocationsViewController()
        locationsViewController.title = Tab.locations.title
        
        return locationsViewController
    }
}

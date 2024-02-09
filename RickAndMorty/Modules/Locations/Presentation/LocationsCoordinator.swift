//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class LocationsCoordinator: NavigationCoordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    let locationsFactory: LocationsFactoryProtocol
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, locationsFactory: LocationsFactoryProtocol) {
        self.navigationController = navigationController
        self.locationsFactory = locationsFactory
    }
    
    // MARK: - Methods
    
    func start() {
        let locationsViewController = locationsFactory.makeLocationsViewController()
        navigationController.pushViewController(locationsViewController, animated: false)
    }
}

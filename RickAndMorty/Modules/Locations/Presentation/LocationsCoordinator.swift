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
    let appContainer: AppContainer
    
    // MARK: - Init
    
    init(appContainer: AppContainer) {
        self.navigationController = appContainer.makeLocationsNavigationController()
        self.appContainer = appContainer
    }
    
    // MARK: - Methods
    
    func start() {
        let locationsViewController = appContainer.makeLocationsViewController()
        navigationController.pushViewController(locationsViewController, animated: false)
    }
}

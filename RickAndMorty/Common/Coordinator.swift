//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

protocol Coordinator {
    func start()
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}

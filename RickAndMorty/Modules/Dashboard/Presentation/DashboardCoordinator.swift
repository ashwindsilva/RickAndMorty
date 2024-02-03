//
//  DashboardCoordinator.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 04/02/24.
//

import UIKit

final class DashboardCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow
    private let appContainer: AppContainer
    
    // MARK: - Init
    
    init(window: UIWindow, appContainer: AppContainer) {
        self.window = window
        self.appContainer = appContainer
    }
    
    // MARK: - Methods
    
    func start() {
        window.rootViewController = appContainer.makeDashboardViewController()
        window.makeKeyAndVisible()
    }
}

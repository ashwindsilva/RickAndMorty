//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 03/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private let appContainer: AppContainer = .init()
    private var dashboardCoordinator: DashboardCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        dashboardCoordinator = DashboardCoordinator(
            window: window!,
            dependency: appContainer
        )
        dashboardCoordinator?.start()
    }
}

//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 03/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
    
        window = UIWindow(windowScene: windowScene)
        
        let dashboardCoordinator = DashboardCoordinator(window: window!, appContainer: .init())
        dashboardCoordinator.start()
        
    }
}
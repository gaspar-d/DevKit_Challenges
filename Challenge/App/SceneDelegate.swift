//
//  SceneDelegate.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 04/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		let navigate = UINavigationController()
		let coordinator = MainCoordinator(navigate: navigate)
		coordinator.start()
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let safeWindow = UIWindow(windowScene: windowScene)
		safeWindow.rootViewController = navigate
		safeWindow.makeKeyAndVisible()
		
		self.window = safeWindow
	}

	func sceneDidDisconnect(_ scene: UIScene) {}

	func sceneDidBecomeActive(_ scene: UIScene) {}

	func sceneWillResignActive(_ scene: UIScene) {}

	func sceneWillEnterForeground(_ scene: UIScene) {}

	func sceneDidEnterBackground(_ scene: UIScene) {}
}


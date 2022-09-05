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

		let navigation = UINavigationController()
		let coordinator = MainCoordinator(navigation: navigation)
		coordinator.start()
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let safeWindow = UIWindow(windowScene: windowScene)
		safeWindow.rootViewController = navigation
		
		// TODO: - To test new Scenes put it in the code line bellow and comment the code line above
		// safeWindow.rootViewController = UINavigationController(rootViewController: NewVCHere())
		
		safeWindow.makeKeyAndVisible()
		
		self.window = safeWindow
	}
}


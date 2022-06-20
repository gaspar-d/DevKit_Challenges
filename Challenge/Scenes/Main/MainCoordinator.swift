//
//  MainCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class MainCoordinator: Coordinator {
	var childCoordinators: [Coordinator] = []
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = MainFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
	
	// MARK: - Handle MainVC table navigation
	func navigateTo(sceneIndex: Int) {
		switch sceneIndex {
		case 0:
			let child = InputMVCCoordinator(navigation: navigation)
			childCoordinators.append(child)
			child.start()
			
		default:
			fatalError("Cell index not found", file: #file, line: #line)
		}
	}
}

//
//  MainCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class MainCoordinator: Coordinator {
	
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = MainFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
	
	// MARK: - Handle MainVC navigation
	func navigateTo(sceneIndex: Int) {
		
		switch sceneIndex {
		case 0:
			let vc = InputIMCFactory.make(coordinator: self)
			navigation.pushViewController(vc, animated: true)
			
		default:
			print("Cell index not found")
		}
	}
	
	// MARK: - Handle IMC challenge navigation
	func navigateToIMC() {
		let vc = ResultIMCFactory.make(coordinator: self)
		
		navigation.pushViewController(vc, animated: true)
	}
}

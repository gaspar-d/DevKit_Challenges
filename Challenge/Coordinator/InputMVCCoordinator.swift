//
//  InputMVCCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import UIKit

final class InputMVCCoordinator: Coordinator {
	var childCoordinators: [Coordinator] = []
	var navigation: UINavigationController
	weak var parentCoordinator: MainCoordinator?
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = InputIMCFactory.make(coordinator: self)
		
		navigation.pushViewController(vc, animated: true)
	}
	
	func didFinishInput() {
		parentCoordinator?.childDidFinish(self)
	}
	
	
	
	
	func navigateToResult() {
		let vc = ResultIMCFactory.make(coordinator: self)
		
		navigation.pushViewController(vc, animated: true)
	}
	
	
//	func navigateToIMC() {
//		let vc = ResultIMCFactory.make(coordinator: self)
//
//		navigation.pushViewController(vc, animated: true)
//	}
	
}

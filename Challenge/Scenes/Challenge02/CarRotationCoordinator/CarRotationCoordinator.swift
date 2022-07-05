//
//  CarRotationCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

protocol CarRotationCoordinatorProtocol: AnyObject {
	func navigateToCarRotationResult()
}

final class CarRotationCoordinator: Coordinator {
	var childCoordinators: [Coordinator] = []
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	public func start() {
		let vc = CarPlateFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

extension CarRotationCoordinator: CarRotationCoordinatorProtocol {
	func navigateToCarRotationResult() {
		let vc = CarRotationFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

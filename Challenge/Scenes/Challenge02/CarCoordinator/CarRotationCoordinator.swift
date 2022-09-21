//
//  CarRotationCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

protocol CarRotationCoordinatorProtocol: AnyObject {
	func navigateToCarRotationResult(with plate: String)
}

final class CarRotationCoordinator: Coordinator {
	public var childCoordinators: [Coordinator] = []
	public var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	public func start() {
		let vc = CarPlateFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

extension CarRotationCoordinator: CarRotationCoordinatorProtocol {
	
	public func navigateToCarRotationResult(with plate: String) {
		let vc = CarRotationFactory.make(plate: plate, coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}


//
//  NumbersCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import UIKit

protocol NumbersCoordinatorProtocol: Coordinator {
	func presentModal(with result: Int)
}

final class NumbersCoordinator: Coordinator {
	var childCoordinators: [Coordinator] = []
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = NumbersFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

extension NumbersCoordinator: NumbersCoordinatorProtocol {
	
	public func presentModal(with result: Int) {
		let modal = ModalFactory.make(coordinator: self, result: result)
		
		navigation.present(modal, animated: true)
	}
}

//
//  InputMVCCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import UIKit

final class InputMVCCoordinator: Coordinator {
	public var childCoordinators: [Coordinator] = []
	public var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	public func start() {
		let vc = InputIMCFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
	
	public func navigateToResultIMC(result: ResultIMCModel) {
		let vc = ResultIMCFactory.make(result: result, coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

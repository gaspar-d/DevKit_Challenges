//
//  MainCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

protocol MainCoordinatorProtocol: Coordinator {
	func navigateTo(sceneIndex: Int)
}

final class MainCoordinator: Coordinator {
	public var childCoordinators: [Coordinator] = []
	public var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	public func start() {
		let vc = MainFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

extension MainCoordinator: MainCoordinatorProtocol {
	
	// MARK: - Handle MainVC table navigation
	public func navigateTo(sceneIndex: Int) {
		switch sceneIndex {
		case 0:
			let child = InputMVCCoordinator(navigation: navigation)
			childCoordinators.append(child)
			child.start()
			
		case 1:
			let child = CarRotationCoordinator(navigation: navigation)
			childCoordinators.append(child)
			child.start()
			
		case 2:
			let child = PalindromeCoordinator(navigation: navigation)
			childCoordinators.append(child)
			child.start()
			
		case 3:
			let child = NumbersCoordinator(navigation: navigation)
			childCoordinators.append(child)
			child.start()
			
		default:
			fatalError("Cell index not found", file: #file, line: #line)
		}
	}
}

//
//  MainCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class MainCoordinator: Coordinator {
	var navigate: UINavigationController
	
	init(navigate: UINavigationController) {
		self.navigate = navigate
	}
	
	func navigate(to scene: Scene) {
		
	}
	
	func start() {
		let vc = MainFactory.make()
		navigate.pushViewController(vc, animated: true)
	}
}

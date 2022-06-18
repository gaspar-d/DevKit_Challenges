//
//  Coordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

enum Scene {
	case resultIMC
}

protocol Coordinator: AnyObject {
	var navigation: UINavigationController { get set }
	func start()
	func navigateTo(sceneIndex: Int)
	func navigateToIMC()
}

// TODO: - I need to change all
// var coordinator: Coordinator?
// from the main flow to
// var coordinator: MainCoordinator?
// and the same with the parameter from the factories

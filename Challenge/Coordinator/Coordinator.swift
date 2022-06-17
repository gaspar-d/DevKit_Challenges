//
//  Coordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation
import UIKit

enum Scene {
	case IMC
}

protocol Coordinator: AnyObject {
	var navigate: UINavigationController { get set }
	func navigate(to scene: Scene)
	func start()
}

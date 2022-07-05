//
//  CarRotationFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

enum CarRotationFactory {
	
	static func make(coordinator: CarRotationCoordinator) -> CarRotationController {
		
		let vm = CarRotationViewModel()
		vm.coordinator = coordinator
		let vc = CarRotationController()
		
		return vc
	}
}

//
//  CarRotationFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

enum CarRotationFactory {
	
	static func make(plate: String, coordinator: CarRotationCoordinator) -> CarRotationController {
		let vm = CarRotationViewModel()
		vm.coordinator = coordinator
		vm.plate = plate
		let customView = CarRotationView()
		let vc = CarRotationController(customView: customView,
									   viewModel: vm)
		
		return vc
	}
}

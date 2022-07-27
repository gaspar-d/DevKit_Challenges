//
//  CarPlateFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

enum CarPlateFactory {
	
	static func make(coordinator: CarRotationCoordinator) -> CarPlateController {
		
		let alert = Alerts()
		let validator = CarRotationValidator()
		let vm = CarPlateViewModel(validator: validator, alert: alert)
		vm.coordinator = coordinator
		let vc = CarPlateController(viewModel: vm)
		
		return vc
	}
}

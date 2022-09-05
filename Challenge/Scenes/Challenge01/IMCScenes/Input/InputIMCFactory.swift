//
//  InputIMCFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

enum InputIMCFactory {
	
	static func make(coordinator: InputIMCCoordinator) -> InputIMCController {
		
		let validator = InputValidator()
		let vm = InputIMCViewModel(validator: validator)
		vm.coordinator = coordinator
		let vc = InputIMCController(viewModel: vm)
		
		return vc
	}
}

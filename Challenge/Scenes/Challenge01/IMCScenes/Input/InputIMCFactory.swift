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
		let alert = Alerts()
		let customView = InputIMCView()
		let vm = InputIMCViewModel(validator: validator, alert: alert)
		vm.coordinator = coordinator
		let vc = InputIMCController(customView: customView, viewModel: vm)
		
		return vc
	}
}

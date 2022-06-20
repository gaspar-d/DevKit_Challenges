//
//  InputIMCFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

enum InputIMCFactory {
	
	static func make(coordinator: InputMVCCoordinator) -> InputIMCController {
		let vm = InputIMCViewModel()
		vm.coordinator = coordinator
		let vc = InputIMCController(viewModel: vm)
		
		return vc
	}
}

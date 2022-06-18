//
//  InputIMCFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

enum InputIMCFactory {
	
	static func make(coordinator: Coordinator) -> InputIMCViewController {
		let vm = InputIMCViewModel()
		vm.coordinator = coordinator
		let vc = InputIMCViewController(viewModel: vm)
		
		return vc
	}
}

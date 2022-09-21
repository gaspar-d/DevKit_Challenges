//
//  NumbersFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import Foundation

enum NumbersFactory {
	
	static func make(coordinator: NumbersCoordinator) -> NumbersController {
		
		let vm = NumbersViewModel()
		vm.coordinator = coordinator
		let vc = NumbersController(viewModel: vm)
		
		return vc
	}
}

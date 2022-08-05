//
//  PalindromeFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 04/08/22.
//

import Foundation

enum PalindromeFactory {
	
	static func make(coordinator: PalindromeCoordinator) -> PalindromeController {

		let alert = Alerts()
		let validator = PalindromeValidator()
		let vm = PalindromeViewModel(validator: validator, alert: alert)
		vm.coordinator = coordinator
		let vc = PalindromeController(viewModel: vm)
		
		return vc
	}
}

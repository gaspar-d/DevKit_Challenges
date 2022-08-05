//
//  PalindromeFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 04/08/22.
//

import Foundation

enum PalindromeFactory {
	
	static func make(coordinator: PalindromeCoordinator) -> PalindromeController {

		let vm = PalindromeViewModel()
		vm.coordinator = coordinator
		let vc = PalindromeController(viewModel: vm)
		
		return vc
	}
}

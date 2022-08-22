//
//  ModalFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import Foundation

enum ModalFactory {
	
	static func make(coordinator: NumbersCoordinator, result: Int) -> ModalViewController {
		
		let vm = ModalViewModel()
		vm.result = result
		let vc = ModalViewController(viewModel: vm)
		
		return vc
	}
}

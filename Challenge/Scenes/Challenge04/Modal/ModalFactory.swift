//
//  ModalFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import Foundation

enum ModalFactory {
	
	static func make(coordinator: NumbersCoordinator) -> ModalViewController {
		
		let vm = ModalViewModel()
//		vm.coordinator = coordinator
		let vc = ModalViewController(viewModel: vm)
		
		return vc
	}
}

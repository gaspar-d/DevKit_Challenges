//
//  ResultIMCFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import Foundation

enum ResultIMCFactory {
	
	static func make(coordinator: Coordinator) -> ResultIMCViewController {
		let vm = ResultIMCViewModel()
		vm.coordinator = coordinator
		let vc = ResultIMCViewController(viewModel: vm)
		
		return vc
	}
}

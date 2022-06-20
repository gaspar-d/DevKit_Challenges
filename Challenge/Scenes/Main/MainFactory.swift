//
//  MainFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

enum MainFactory {
	
	static func make(coordinator: MainCoordinator) -> MainViewController {
		let model = ChallengesModel()
		let vm = MainViewModel(model: model)
		vm.coordinator = coordinator
		let vc = MainViewController(viewModel: vm)
		
		return vc
	}
}

//
//  MainFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

enum MainFactory {
	
	static func make(coordinator: MainCoordinator) -> MainController {
		let model = ChallengesModel()
		let customView = MainView()
		let vm = MainViewModel(model: model)
		vm.coordinator = coordinator
		let vc = MainController(customView: customView, viewModel: vm)
		
		return vc
	}
}

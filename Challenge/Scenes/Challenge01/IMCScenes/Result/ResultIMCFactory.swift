//
//  ResultIMCFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import Foundation

enum ResultIMCFactory {
	
	static func make(result: ResultIMCModel, coordinator: InputIMCCoordinator) -> ResultIMCController {
		let model = ResultIMCModel(height: result.height, weight: result.weight)
		let vm = ResultIMCViewModel(model: model)
		vm.coordinator = coordinator
		let vc = ResultIMCController(viewModel: vm)
		
		return vc
	}
}

//
//  ResultIMCFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import Foundation

enum ResultIMCFactory {
	
	static func make(result: ResultIMCModel, coordinator: InputMVCCoordinator) -> ResultIMCViewController {
		let model = ResultIMCModel(height: result.height, weight: result.weight)
		let vm = ResultIMCViewModel(model: model)
		vm.coordinator = coordinator
		let vc = ResultIMCViewController(viewModel: vm)
		
		return vc
	}
}

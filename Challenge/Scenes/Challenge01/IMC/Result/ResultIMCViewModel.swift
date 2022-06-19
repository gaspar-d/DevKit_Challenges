//
//  ResultIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import Foundation

final class ResultIMCViewModel: NSObject {
	
	var coordinator: InputMVCCoordinator?
	private var model: ResultIMCModel
	
	init(model: ResultIMCModel) {
		self.model = model
	}
}

extension ResultIMCViewModel {
	
	public var getResult: Float? {
		model.weight / (model.height * model.height) * 10000
		
	}
}

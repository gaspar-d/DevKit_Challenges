//
//  InputIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

protocol InputIMCViewModelProtocol: AnyObject {
	func navigateToResult(result: ResultIMCModel)
	func validateUserInput(height: String, weight: String) -> ResultIMCModel
}

final class InputIMCViewModel: NSObject {
	weak var coordinator: InputMVCCoordinator?
	private let validator: InputValidator?
	
	init(validator: InputValidator = InputValidator.shared) {
		self.validator = validator
	}
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	
	public func navigateToResult(result: ResultIMCModel) {
		coordinator?.navigateToResultIMC(result: result)
	}
	
	public func validateUserInput(height: String, weight: String) -> ResultIMCModel {
		
		validator?.validateUserInput(height: height, weight: weight) ?? ResultIMCModel(height: 0, weight: 0)
	}
}

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
	func isTextFieldEmpty(height: String, weight: String) -> Bool
	func weightIsValid(weight: String) -> Bool
	func heightIsValid(height: String) -> Bool
}

final class InputIMCViewModel: NSObject {
	weak var coordinator: InputMVCCoordinatorProtocol?
	public let validator: InputValidatorProtocol
	
	init(validator: InputValidatorProtocol) {
		self.validator = validator
	}
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	
	public func navigateToResult(result: ResultIMCModel) {
		coordinator?.navigateToResultIMC(result: result)
	}
	
	public func validateUserInput(height: String, weight: String) -> ResultIMCModel {
		validator.convertUserInputToFloat(height: height, weight: weight)
	}
	
	public func isTextFieldEmpty(height: String, weight: String) -> Bool {
		validator.isInputEmpty(height: height, weight: weight)
	}
	
	public func weightIsValid(weight: String) -> Bool {
		validator.isWeightOutOfRange(weight: weight)
	}
	
	public func heightIsValid(height: String) -> Bool {
		validator.isHeightOutOfRange(height: height)
	}
}

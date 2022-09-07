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
	
	func isInputValid(height: String, weight: String, controller: UIViewController)
}

final class InputIMCViewModel: NSObject {
	weak var coordinator: InputMVCCoordinatorProtocol?
	public let validator: InputValidatorProtocol
	private let alert: AlertsProtocol
	
	init(validator: InputValidatorProtocol, alert: AlertsProtocol) {
		self.validator = validator
		self.alert = alert
	}
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	
	public func navigateToResult(result: ResultIMCModel) {
		coordinator?.navigateToResultIMC(result: result)
	}
	
	public func validateUserInput(height: String, weight: String) -> ResultIMCModel {
		validator.convertUserInputToFloat(height: height, weight: weight)
	}
	
	public func isInputValid(height: String, weight: String, controller: UIViewController) {

		if validator.isInputEmpty(height: height, weight: weight) {
			alert.popup(title: "Opa faltou digitar algo?",
						message: "Por favor preencha todos os campos \n para podermos calcular seu IMC",
						controller: controller)
		}
		
		if validator.isWeightOutOfRange(weight: weight) {
			alert.popup(title: "Peso fora do limite aceito pelo App",
						message: "O peso precisa estar entre 15 e 150kg",
						controller: controller)
		}
		
		if validator.isHeightOutOfRange(height: height) {
			alert.popup(title: "Altura fora do limite aceito pelo App",
						message: "A altura precisa estar entre 100 e 210 centímetros.",
						controller: controller)
		}
	}
}

//
//  CarPlateViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation
import UIKit

protocol CarPlateViewModelProtocol: AnyObject {
	func navigateToCarRotation(with plate: String)
	func isInputValid(with plate: String, controller: UIViewController)
}

final class CarPlateViewModel: NSObject {
	
	public weak var coordinator: CarRotationCoordinator?
	private let validator: CarRotationValidatorProtocol
	private let alert: AlertsProtocol
	
	init(validator: CarRotationValidatorProtocol, alert: AlertsProtocol) {
		self.validator = validator
		self.alert = alert
	}
}

extension CarPlateViewModel: CarPlateViewModelProtocol {
	public func navigateToCarRotation(with plate: String) {
		coordinator?.navigateToCarRotationResult(with: plate)
	}
	
	public func isInputValid(with plate: String, controller: UIViewController) {
		
		guard validator.isPlateFieldEmpty(with: plate) else { return }
			alert.popup(title: "Campo vazio",
						message: "Insira a numeração de sua placa para prosseguir",
						controller: controller)
		
		guard validator.isPlateValidLength(with: plate) else { return }
			alert.popup(title: "Placa com números faltantes",
						message: "Ambas placas modelo Mercosul e antiga precisam de 7 dígitos",
						controller: controller)
		
		guard validator.isPlateFormatCorrect(with: plate) else { return }
			alert.popup(title: "Placa em formato inválido",
						message: "Placas tem formato: \n (mercosul) XXX 0X00\n (antigo) XXX 0000",
						controller: controller)
	}
}

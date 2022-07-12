//
//  CarPlateViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

protocol CarPlateViewModelProtocol: AnyObject {
	func navigateToCarRotation(with plate: String)
	func isPlateValid(with plate: String) -> Bool
	func isPlateFieldEmpty(with plate: String) -> Bool
	func isPlateFormatCorrect(with plate: String) -> Bool
}

final class CarPlateViewModel: NSObject {
	
	public weak var coordinator: CarRotationCoordinator?
	private let validator: CarRotationValidatorProtocol
	
	init(validator: CarRotationValidatorProtocol) {
		self.validator = validator
	}
}

extension CarPlateViewModel: CarPlateViewModelProtocol {
	public func navigateToCarRotation(with plate: String) {
		coordinator?.navigateToCarRotationResult(with: plate)
	}
	
	public func isPlateValid(with plate: String) -> Bool{
		return validator.isPlateValid(with: plate)
	}
	
	public func isPlateFieldEmpty(with plate: String) -> Bool{
		return validator.isPlateFieldEmpty(with: plate)
	}
	
	public func isPlateFormatCorrect(with plate: String) -> Bool {
		return validator.isPlateFormatCorrect(with: plate)
	}
}

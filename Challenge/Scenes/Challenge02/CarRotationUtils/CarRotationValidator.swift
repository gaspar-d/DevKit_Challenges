//
//  CarRotationValidator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/07/22.
//

import Foundation

protocol CarRotationValidatorProtocol {
	func isPlateFieldEmpty(with plate: String) -> Bool
	func isPlateValid(with plate: String) -> Bool
}

final class CarRotationValidator {}

extension CarRotationValidator: CarRotationValidatorProtocol {
	
	func isPlateValid(with plate: String) -> Bool {
		return plate.count < 8
	}
	
	func isPlateFieldEmpty(with plate: String) -> Bool {
		return plate.isEmpty
	}
}

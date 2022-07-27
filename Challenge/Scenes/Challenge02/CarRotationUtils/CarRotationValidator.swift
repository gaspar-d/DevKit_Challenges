//
//  CarRotationValidator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/07/22.
//

import Foundation

protocol CarRotationValidatorProtocol {
	func isPlateFieldEmpty(with plate: String) -> Bool
	func isPlateValidLength(with plate: String) -> Bool
	func isPlateFormatCorrect(with plate: String) -> Bool
}

final class CarRotationValidator {}

extension CarRotationValidator: CarRotationValidatorProtocol {
	
	public func isPlateValidLength(with plate: String) -> Bool {
		return plate.count < 8
	}
	
	public func isPlateFieldEmpty(with plate: String) -> Bool {
		return plate.isEmpty
	}
	
	public func isPlateFormatCorrect(with plate: String) -> Bool {
		let nameRegex = #"^[A-Z]{3}\s[0-9][A-Z0-9][0-9]{2}$"#
		let result = plate.range(of: nameRegex, options: .regularExpression)
		
		return result == nil
	}
}

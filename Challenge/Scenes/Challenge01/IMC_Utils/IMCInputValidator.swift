//
//  IMCInputValidator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 21/06/22.
//

import Foundation

final class InputValidator {
	
	public func convertUserInputToFloat(height: String, weight: String) -> ResultIMCModel {
		
		let trimmedHeight = height.trimmingCharacters(in: .whitespacesAndNewlines)
		let trimmedWeight = weight.trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard let convertedHeight = Float(trimmedHeight),
			  let convertedWeight = Float(trimmedWeight)
				
		else {
			return ResultIMCModel(height: 0, weight: 0)
		}
		
		let result = ResultIMCModel(height: convertedHeight, weight: convertedWeight)
		
		return result
	}
	
	public func isInputEmpty(height: String, weight: String) -> Bool {
		var value = false
		
		if height.isEmpty || weight.isEmpty {
			value = true
		}
		
		return value
	}
	
	public func isWeightOutOfRange(weight: String) -> Bool {
		let trimmedWeight = weight.trimmingCharacters(in: .whitespacesAndNewlines)
		var value = true
		
		guard let convertedWeight = Float(trimmedWeight),
			  convertedWeight < 15 || convertedWeight > 150
		
		else {
			value = false
			return value }
		
		return value
	}
	
	public func isHeightOutOfRange(height: String) -> Bool {
		let trimmedHeight = height.trimmingCharacters(in: .whitespacesAndNewlines)
		var value = true
		
		guard let convertedHeight = Float(trimmedHeight),
			  convertedHeight < 100 || convertedHeight > 210
				
		else {
			value = false
			return value }
		
		return value
	}
}


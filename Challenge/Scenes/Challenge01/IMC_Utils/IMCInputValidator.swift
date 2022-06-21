//
//  IMCInputValidador.swift
//  Challenge
//
//  Created by Diogo Gaspar on 21/06/22.
//

import Foundation

final class InputValidator {
	
	static let shared = InputValidator()
	
	private init() {}
	
	public func validateUserInput(height: String, weight: String) -> ResultIMCModel {
		
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
}

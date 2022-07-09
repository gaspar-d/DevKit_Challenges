//
//  ViewCodeTemplate.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

protocol ViewCodeTemplate {
	func setup()
	func setupComponents()
	func setupConstraints()
	func setupExtraConfiguration()
}

extension ViewCodeTemplate {
	func setup() {
		setupComponents()
		setupConstraints()
		setupExtraConfiguration()
	}
	
	func setupExtraConfiguration() {}
}


extension String {
	func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
				var pureNumber = self.replacingOccurrences(of: "ˆ[0-9]$", with: "", options: .regularExpression)
		//		print(pureNumber)
//		var pureNumber = self
		
		for index in 0 ..< pattern.count {
			guard index < pureNumber.count else { return pureNumber}
			
			let stringIndex = String.Index(utf16Offset: index, in: pattern)
			let patternCharacter = pattern[stringIndex]
			
			guard patternCharacter != replacementCharacter else { continue }
			pureNumber.insert(patternCharacter, at: stringIndex)
		}
		return pureNumber
	}
}

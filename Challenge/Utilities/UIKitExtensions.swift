//
//  UIKitExtensions.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/07/22.
//

import Foundation

extension String {
	mutating func applyPatternOnString(pattern: String, replacementCharacter: Character) -> String {
		
		for index in 0 ..< pattern.count {
			guard index < self.count else { return self }
			
			let stringIndex = String.Index(utf16Offset: index, in: pattern)
			let patternCharacter = pattern[stringIndex]
			
			guard patternCharacter != replacementCharacter else { continue }
			self.insert(patternCharacter, at: stringIndex)
		}
		return self
	}
}


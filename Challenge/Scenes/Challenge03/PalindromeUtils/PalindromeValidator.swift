//
//  PalindromeValidator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 04/08/22.
//

import Foundation

protocol PalindromeValidatorProtocol: AnyObject {
	func isInputEmpty(text: String) -> Bool
	func isPalindrome(text: String) -> Bool
}

final class PalindromeValidator { }

extension PalindromeValidator: PalindromeValidatorProtocol {
	
	public func isInputEmpty(text: String) -> Bool {
		let noSpacesText = text.filter { !$0.isWhitespace }
		return noSpacesText.isEmpty
	}
	
	public func isPalindrome(text: String) -> Bool {
		
		let noSpacesText = text.filter { !$0.isWhitespace }
		let splittedText = noSpacesText.map { $0 }
		let reversedText = Array(splittedText.reversed())
		let reverseJoinedText = String(reversedText)
		
		if noSpacesText == reverseJoinedText {
			return true
		}
		
		return false
	}
}

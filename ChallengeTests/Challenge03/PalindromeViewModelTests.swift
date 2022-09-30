//
//  PalindromeViewModelTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 21/09/22.
//

import XCTest
@testable import Challenge

final class PalindromeViewModelTests: XCTestCase {
	
	func buildSut() -> PalindromeViewModel {
		let spyValidator = ValidatorSpy()
		let alert = Alerts()
		let sut = PalindromeViewModel(validator: spyValidator,
									  alert: alert)

		return sut
	}
	
	func test_isPalindrome_isFalse() {
		
		// when
		let sut = buildSut()
		let inputIsFalse = "O galo ama o lago"
		let controller = UIViewController()
		
		// given
		sut.isPalindrome(input: inputIsFalse, controller: controller)
		
		// then
	}
}

// MARK: - Mocks

class ValidatorSpy: PalindromeValidatorProtocol {
	var isInputEmpty = false
	var isPalindrome = false
	var text: String? = nil
	
	func isInputEmpty(text: String) -> Bool {
		self.isInputEmpty = true
		self.text = text
		return true
	}
	
	func isPalindrome(text: String) -> Bool {
		self.isPalindrome = true
		self.text = text
		return true
	}
}

class PalindromeViewModelMock: PalindromeViewModelProtocol {
	
	func navigateToPalindromeDescription() {}
	
	var input: String?
	var controller: UIViewController?
	
	func isPalindrome(input: String, controller: UIViewController) {
		self.input = input
		self.controller = controller
	}
}

//
//  PalindromeCoordinatorTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 13/09/22.
//

import XCTest
@testable import Challenge

class PalindromeCoordinatorTests: XCTestCase {

	var sut = PalindromeCoordinator(navigation: UINavigationController())
	var mock = PalindromeCoordinatorProtocolMock()
	
	func test_navigateToPalindromeDescription() {
		XCTAssertNotNil(sut.navigateToPalindromeDescription())
	
		XCTAssertFalse(mock.navigateToPalindrome)
		mock.navigateToPalindromeDescription()
		XCTAssertTrue(mock.navigateToPalindrome)
	}
}

class PalindromeCoordinatorProtocolMock: PalindromeCoordinatorProtocol {
	var navigateToPalindrome: Bool = false
	
	func navigateToPalindromeDescription() {
		self.navigateToPalindrome = true
		
	}
	
	
	
}

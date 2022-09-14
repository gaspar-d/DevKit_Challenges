//
//  PalindromeCoordinatorTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 13/09/22.
//

import XCTest
@testable import Challenge

class PalindromeCoordinatorTests: XCTestCase {

	var sut = PalindromeCoordinator(navigation: NavigationControllerMock())
	var mock = PalindromeCoordinatorProtocolMock()
	var navigation = NavigationControllerMock()
	
	func test_navigateToPalindromeDescription() {
		
		XCTAssertNotNil(sut.navigateToPalindromeDescription())
		XCTAssertFalse(mock.navigateToPalindrome)
		mock.navigateToPalindromeDescription()
		XCTAssertTrue(mock.navigateToPalindrome)
	}
	
	func test_PalindromeWebSceneDidAppear() {
		XCTAssertFalse(navigation.pushViewControllerTesting)
		navigation.pushViewController(UIViewController(), animated: true)
		XCTAssertTrue(navigation.pushViewControllerTesting)
	}
}

class PalindromeCoordinatorProtocolMock: PalindromeCoordinatorProtocol {
	var navigateToPalindrome: Bool = false
	
	func navigateToPalindromeDescription() {
		self.navigateToPalindrome = true
	}
}


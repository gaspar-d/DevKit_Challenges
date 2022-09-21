//
//  PalindromeCoordinatorTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 13/09/22.
//

import XCTest
@testable import Challenge

class PalindromeCoordinatorTests: XCTestCase {

	var spy = NavigationControllerMock()
	
	func buildSut() -> PalindromeCoordinator {
		let sut = PalindromeCoordinator(navigation: spy)
		
		return sut
	}
	
	func buildMock() -> PalindromeCoordinatorProtocolMock {
		let mock = PalindromeCoordinatorProtocolMock(navigation: spy)
		
		return mock
	}
	
	func test_navigateToPalindromeDescription_true() {
		
		// when
		let sut = buildSut()
		
		// given
		sut.navigateToPalindromeDescription()
		
		// then
		XCTAssertTrue(spy.presentControllerTesting)
	}
	
	func test_start() {
		
		// when
		let sut = buildSut()
		
		// given
		sut.start()
		
		// then
		XCTAssertTrue(spy.pushViewControllerTesting)
	}
	
	func test_navigateToPalindromeDescription() {
		let sut = buildSut()
		let mock = buildMock()
		
		XCTAssertNotNil(sut.navigateToPalindromeDescription())
		XCTAssertFalse(mock.navigateToPalindrome)
		mock.navigateToPalindromeDescription()
		XCTAssertTrue(mock.navigateToPalindrome)
	}
	
	func test_PalindromeWebSceneDidAppear() {
		XCTAssertFalse(spy.pushViewControllerTesting)
		spy.pushViewController(UIViewController(), animated: true)
		XCTAssertTrue(spy.pushViewControllerTesting)
	}
}

class PalindromeCoordinatorProtocolMock: PalindromeCoordinatorProtocol {
	var childCoordinators: [Challenge.Coordinator] = []
	
	var navigation: UINavigationController
	var started = false
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		self.started = true
	}
	
	var navigateToPalindrome: Bool = false
	
	func navigateToPalindromeDescription() {
		self.navigateToPalindrome = true
	}
}


//
//  PalindromeControllerTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 21/09/22.
//

import XCTest
@testable import Challenge

final class PalindromeControllerTests: XCTestCase {
	
	var spy: NavigationControllerMock!
	var coordinator: PalindromeCoordinator!

	override func setUp() {
		
	spy = NavigationControllerMock()
	coordinator = PalindromeCoordinator(navigation: spy)
	
	}
	
	func buildSut() -> PalindromeController {
		let sut = PalindromeFactory.make(coordinator: coordinator)
		
		return sut
	}
	
	// TODO: - Finish this tests after UI test is done.
	
	func test_setHelpButtonAction() {
		
		// when
		let sut = buildSut()
		
		// given
		sut.setHelpButtonAction()
		
		// then
		
	}
	
	override func tearDown() {
		spy = nil
		coordinator = nil
	}
}

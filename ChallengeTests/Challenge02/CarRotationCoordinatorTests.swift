//
//  CarRotationCoordinatorTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 13/09/22.
//

import XCTest
@testable import Challenge

class CarRotationCoordinatorTests: XCTestCase {
	let spy = NavigationControllerMock()
	
	func buildSut() -> CarRotationCoordinator {
		let sut = CarRotationCoordinator(navigation: spy)
		
		return sut
	}
	
	func test_navigateToCarRotationResult() {
		
		// when
		let sut = buildSut()
		let plate = "AAA 3333"
		
		// given
		sut.navigateToCarRotationResult(with: plate)
		
		// then
		XCTAssertTrue(spy.pushViewControllerTesting)
	}
}

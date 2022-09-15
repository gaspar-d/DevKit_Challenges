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
	
	//	var mock = CarRotationCoordinatorProtocolMock()
	
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
	
	
	//
	//		XCTAssertFalse(mock.navigateToCarRotationResult)
	//		mock.navigateToCarRotationResult(with: "1")
	//		XCTAssertTrue(mock.navigateToCarRotationResult)
	//		XCTAssertEqual(mock.plate, "1")
	
}
	
class CarRotationCoordinatorProtocolMock: CarRotationCoordinatorProtocol {
	
	var navigateToCarRotationResult: Bool = false
	var plate: String?
	
	func navigateToCarRotationResult(with plate: String) {
		self.plate = plate
		self.navigateToCarRotationResult = true
	}
}

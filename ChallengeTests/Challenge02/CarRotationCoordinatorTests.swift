//
//  CarRotationCoordinatorTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 13/09/22.
//

import XCTest
@testable import Challenge

class CarRotationCoordinatorTests: XCTestCase {
	
	var sut = CarRotationCoordinator(navigation: UINavigationController())
	var mock = CarRotationCoordinatorProtocolMock()
	
	func test_navigateToCarRotationResult() {
		XCTAssertNotNil(sut.navigateToCarRotationResult(with: "1"))
		
		XCTAssertFalse(mock.navigateToCarRotationResult)
		mock.navigateToCarRotationResult(with: "1")
		XCTAssertTrue(mock.navigateToCarRotationResult)
		XCTAssertEqual(mock.plate, "1")
	}
}
	
class CarRotationCoordinatorProtocolMock: CarRotationCoordinatorProtocol {
	
	var navigateToCarRotationResult: Bool = false
	var plate: String?
	
	func navigateToCarRotationResult(with plate: String) {
		self.plate = plate
		self.navigateToCarRotationResult = true
	}
}

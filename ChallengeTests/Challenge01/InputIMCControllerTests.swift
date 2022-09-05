//
//  InputIMCControllerTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 05/09/22.
//

import XCTest
@testable import Challenge

class InputIMCControllerTests: XCTestCase {
	
	let sut = InputIMCFactory.make(
		coordinator: InputIMCCoordinator(
			navigation: UINavigationController()))
	
	func test_isValidInputAlert() {
		XCTAssertNotNil(sut.isValidInputAlert(title: "", message: ""))
	}
	
	func test_requiredInit() {
		let sutInit = InputIMCController(coder: NSCoder())
		XCTAssertNil(sutInit)
	}
}

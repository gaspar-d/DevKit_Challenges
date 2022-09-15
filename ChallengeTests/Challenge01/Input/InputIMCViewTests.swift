//
//  InputIMCViewTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class InputIMCViewTests: XCTestCase {

	var sutInit = InputIMCView(coder: NSCoder())
	var sut = InputIMCView()
	var buttonTapped: Bool = false
	
	func test_Init() {
		XCTAssertNil(sutInit)
	}

	func test_getInputHeight() {
		XCTAssertEqual(sut.getInputHeight, "")
	}
	
	func test_getInputWeight() {
		XCTAssertEqual(sut.getInputWeight, "")
	}
}

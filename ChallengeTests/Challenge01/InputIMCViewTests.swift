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
	
	func test_Init() {
		XCTAssertNil(sutInit)
	}

	func test_buttonAction() {
		sut.buttonAction(target: self, action: #selector(test_buttonTapped))
	}
	
	@objc func test_buttonTapped() {
		print("Button working")
	}
	
	func test_getInputHeight() {
		XCTAssertEqual(sut.getInputHeight, "")
	}
	
	func test_getInputWeight() {
		XCTAssertEqual(sut.getInputWeight, "")
	}
	
}

//
//  InputIMCViewModelTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class InputIMCViewModelTests: XCTestCase {
	
	var test_result = ResultIMCModel(height: 100, weight: 101)
	var sut = InputIMCViewModel(validator: InputValidator())
	
	func test_navigateToResult() {
		XCTAssertNotNil(sut.navigateToResult(result: test_result))
	}
	
	func test_validateUserInput() {
		let mockSuccess = sut.validateUserInput(height: "100", weight: "101")
		
		XCTAssertEqual(mockSuccess, test_result)
	}
	
	func test_isTextFieldEmpty() {
		let mockTrue = sut.isTextFieldEmpty(height: "", weight: "")
		XCTAssertTrue(mockTrue)

		let mockFalse = sut.isTextFieldEmpty(height: "100", weight: "101")
		XCTAssertFalse(mockFalse)
	}
	
	func test_weightIsValid() {
		XCTAssertTrue(sut.weightIsValid(weight: "0"))
		XCTAssertTrue(sut.weightIsValid(weight: "151"))
		XCTAssertFalse(sut.weightIsValid(weight: "80"))
	}
	
	func test_heightIsValid() {
		XCTAssertTrue(sut.heightIsValid(height: "0"))
		XCTAssertTrue(sut.heightIsValid(height: "211"))
		XCTAssertFalse(sut.heightIsValid(height: "180"))
	}
}


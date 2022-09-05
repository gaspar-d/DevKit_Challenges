//
//  InputValidatorProtocolTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class InputValidatorProtocolTests: XCTestCase {
	
	var sut = InputValidator()
	var height: String = "100"
	var weight: String = "100"
	
	func test_convertUserInputToFloat() {
		let result = ResultIMCModel(height: 100, weight: 100)
		let emptyInput: String = ""
		
		XCTAssertEqual(sut.convertUserInputToFloat(height: self.height, weight: self.weight), result)
		XCTAssertNotEqual(sut.convertUserInputToFloat(height: emptyInput, weight: emptyInput), result)
	}
	
	func test_isInputEmpty() {
		XCTAssertFalse(sut.isInputEmpty(height: self.height, weight: self.weight))
		XCTAssertTrue(sut.isInputEmpty(height: "", weight: ""))
	}
	
	func test_isWeightOutOfRange() {
		XCTAssertFalse(sut.isWeightOutOfRange(weight: self.weight))
		XCTAssertTrue(sut.isWeightOutOfRange(weight: "14"))
		XCTAssertTrue(sut.isWeightOutOfRange(weight: "151"))
	}
	
	func test_isHeightOutOfRange() {
		XCTAssertFalse(sut.isHeightOutOfRange(height: self.height))
		XCTAssertTrue(sut.isHeightOutOfRange(height: "99"))
		XCTAssertTrue(sut.isHeightOutOfRange(height: "211"))
	}
}

//
//  CarRotationValidatorTest.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 14/09/22.
//

import XCTest
@testable import Challenge

final class CarRotationValidatorTest: XCTestCase {
	
	var mock = CarRotationValidatorMock()
	var sut = CarRotationValidator()
	
	func test_isPlateFieldEmpty() {
		XCTAssertTrue(sut.isPlateFieldEmpty(with: "")) // this is only for coverage completion
		XCTAssertTrue(mock.isPlateFieldEmpty(with: ""))
	}
	
	func test_isPlateValidLength() {
		XCTAssertTrue(sut.isPlateValidLength(with: ""))
		XCTAssertTrue(mock.isPlateValidLength(with: ""))
	}
	
	func test_isPlateFormatCorrect() {
		XCTAssertTrue(sut.isPlateFormatCorrect(with: ""))
		XCTAssertTrue(mock.isPlateFormatCorrect(with: ""))
	}
}

class CarRotationValidatorMock: CarRotationValidatorProtocol {
	
	var plate: String?
	var isPlateFieldEmpty = false
	var isPlateValidLength = false
	var isPlateFormatCorrect = false
	
	
	func isPlateFieldEmpty(with plate: String) -> Bool {
		self.plate = plate
		self.isPlateFieldEmpty = true
		
		return self.isPlateFieldEmpty
	}
	
	func isPlateValidLength(with plate: String) -> Bool {
		self.plate = plate
		self.isPlateValidLength = true
		
		return self.isPlateValidLength
	}
	
	func isPlateFormatCorrect(with plate: String) -> Bool {
		self.plate = plate
		self.isPlateFormatCorrect = true
		
		return self.isPlateFormatCorrect
	}
}

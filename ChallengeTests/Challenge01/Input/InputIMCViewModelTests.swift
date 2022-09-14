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
	var sut = InputIMCViewModel(validator: InputValidator(), alert: Alerts())
	var sutMock  = InputIMCViewModelProtocolMock()
	
	func test_navigateToResult() {
		XCTAssertNotNil(sut.navigateToResult(result: test_result))
		
		XCTAssertFalse(sutMock.navigateToResult)
		sutMock.navigateToResult(result: test_result)
		
		XCTAssertTrue(sutMock.navigateToResult)
		XCTAssertEqual(sutMock.result, test_result)
	}
	
	func test_validateUserInput() {
		let mock = sut.validateUserInput(height: "100", weight: "101")
		XCTAssertEqual(mock, test_result)
		
		XCTAssertFalse(sutMock.validateUserInput)
		XCTAssertNotNil(sutMock.validateUserInput(height: "100", weight: "101"))
		XCTAssertTrue(sutMock.validateUserInput)
		XCTAssertEqual(sutMock.height, "100")
		XCTAssertEqual(sutMock.weight, "101")
		XCTAssertEqual(sutMock.result, test_result)
	}
	
	func test_isInputValid() {
		sut.isInputValid(height: "", weight: "", controller: UIViewController())
		sut.isInputValid(height: "100", weight: "100", controller: UIViewController())
		sut.isInputValid(height: "14", weight: "100", controller: UIViewController())
		sut.isInputValid(height: "100", weight: "14", controller: UIViewController())
		
		XCTAssertFalse(sutMock.isInputValid)
		
		sutMock.isInputValid(height: "100",
							 weight: "101",
							 controller: UIViewController())
		
		XCTAssertTrue(sutMock.isInputValid)
		XCTAssertEqual(sutMock.height, "100")
		XCTAssertEqual(sutMock.weight, "101")
	}
}


// MARK: - Mocks

class InputIMCViewModelProtocolMock: InputIMCViewModelProtocol {

	var result =  ResultIMCModel(height: 100, weight: 101)
	var navigateToResult: Bool = false
	var validateUserInput: Bool = false
	var isInputValid: Bool = false
	var height: String?
	var weight: String?
	var controller: UIViewController?

	func navigateToResult(result: ResultIMCModel) {
		self.navigateToResult = true
		self.result = result
	}

	func validateUserInput(height: String, weight: String) -> ResultIMCModel {
		self.validateUserInput = true
		self.height = height
		self.weight = weight
		return self.result
	}

	func isInputValid(height: String, weight: String, controller: UIViewController) {
		self.isInputValid = true
		self.height = height
		self.weight = weight
		self.controller = controller
	}
}

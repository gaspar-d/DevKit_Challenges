//
//  ResultIMCViewModelTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 13/09/22.
//

import XCTest
@testable import Challenge

class ResultIMCViewModelTests: XCTestCase {

	var sut: ResultIMCViewModel?
	
	func test_getResult_lowerThanNormal() {
		sut = ResultIMCViewModel(model: ResultIMCModel(height: 180, weight: 50))
		
		XCTAssertEqual(sut?.getResult, "15.4")
	}
	
	func test_getResult_normal() {
		sut = ResultIMCViewModel(model: ResultIMCModel(height: 180, weight: 80))
		XCTAssertEqual(sut?.getResult, "24.7")
	}
	
	func test_getResult_overweight() {
		sut = ResultIMCViewModel(model: ResultIMCModel(height: 180, weight: 90))
		XCTAssertEqual(sut?.getResult, "27.8")
	}
	
	func test_getResult_obesityLevelOne() {
		sut = ResultIMCViewModel(model: ResultIMCModel(height: 180, weight: 100))
		XCTAssertEqual(sut?.getResult, "30.9")
	}
	
	func test_getResult_obesityLevelTwo() {
		sut = ResultIMCViewModel(model: ResultIMCModel(height: 180, weight: 120))
		XCTAssertEqual(sut?.getResult, "37.0")
	}
	
	func test_getResult_obesityLevelThree() {
		sut = ResultIMCViewModel(model: ResultIMCModel(height: 180, weight: 130))
		XCTAssertEqual(sut?.getResult, "40.1")
	}
}

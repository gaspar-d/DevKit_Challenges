//
//  ResultIMCViewTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 14/09/22.
//

import XCTest
@testable import Challenge

final class ResultIMCViewTests: XCTestCase {

	var sut: ResultIMCView!
	
	override func setUp() {
		sut = ResultIMCView()
	}

	// TODO: - How to test it???
	
	func test_setClassificationResult() {
		sut.setClassificationResult(with: "test", and: UIColor.black)
	}
}

//
//  TextFieldLimiterTest.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 05/09/22.
//

import XCTest
@testable import Challenge

class TextFieldLimiterTest: XCTestCase, TextFieldLimiter {
	
	func test_textLimit_True() {
		XCTAssertTrue(textLimit("123", newText: "456", limit: 6))
	}
	
	func test_textLimit_False() {
		XCTAssertFalse(textLimit("123", newText: "456", limit: 5))
	}
}

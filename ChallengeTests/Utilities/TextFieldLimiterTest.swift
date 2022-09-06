//
//  TextFieldLimiterTest.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 05/09/22.
//

import XCTest
@testable import Challenge

class TextFieldLimiterTest: XCTestCase, TextFieldLimiter {
	
	func test_textLimit() {
		XCTAssertTrue(textLimit("123", newText: "456", limit: 6))
		XCTAssertFalse(textLimit("123", newText: "456", limit: 5))
	}
}

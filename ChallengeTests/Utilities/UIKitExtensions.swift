//
//  UIKitExtensions.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 06/09/22.
//

import XCTest
@testable import Challenge

class UIKitExtensions: XCTestCase {

	func test_applyPatternOnString() {
		var text = "abcde"
		let result = text.applyPatternOnString(pattern: "# # # # #", replacementCharacter: "#")
		
		XCTAssertEqual(result, "a b c d e")
		
	}
}

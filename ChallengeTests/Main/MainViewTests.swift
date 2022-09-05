//
//  MainViewTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 29/08/22.
//

import XCTest
@testable import Challenge

class MainViewTests: XCTestCase {

	let sut = MainView(coder: NSCoder())
	
	func test_InitCoder() {
		// TODO: - FatalError ???
		XCTAssertNil(sut)
	}
}

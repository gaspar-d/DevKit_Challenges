//
//  MainViewModelTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 31/08/22.
//

import XCTest
@testable import Challenge

class MainViewModelTests: XCTestCase {

	let sut = MainViewModelProtocolMock()
	
	func test_DidTapCell() {
		XCTAssertFalse(sut.didTapCell)
		sut.didTapCell(index: 1)

		XCTAssertTrue(sut.didTapCell)
		XCTAssertEqual(sut.index, 1)
	}
	
	func test_GetNames() {
		XCTAssertEqual(sut.getNames, ["Joe", "Doe"])
	}
}

// MARK: - Mocks

class MainViewModelProtocolMock: MainViewModelProtocol {
	var getNames: [String] = ["Joe", "Doe"]
	
	var didTapCell: Bool = false
	var index: Int?
	
	func didTapCell(index: Int) {
		didTapCell = true
		self.index = index
	}
}

//
//  ChallengeTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 25/08/22.
//

import XCTest
@testable import Challenge

// MARK: - Mocks

class MainViewModelMock: MainViewModelProtocol {
	var getNames: [String] = []
	
	func didTapCell(index: Int) {
		
	}
}

// MARK: - Tests
class ChallengeTests: XCTestCase {
	
	var sut: MainController?
	var mock: MainViewModelProtocol?

    override func setUpWithError() throws {
		print(1)
		sut = MainController(viewModel: mock!)
		sut?.loadView()
    }

    override func tearDownWithError() throws {
		print(3)
    }

    func testExample() throws {
		
		let test = sut?.thingForTest
		print(#line, test)
		
		XCTAssertEqual(test, "The name of the test")
		
    }

//    func testPerformanceExample() throws {
//        measure {
//        }
//    }

}

//
//  InputIMCCoordinator.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class InputIMCCoordinatorTests: XCTestCase {
	
	var sutMock: InputIMCController!
	var coordinator: InputIMCCoordinator!
	var spy: NavigationControllerMock!

    override func setUp() {
		spy = NavigationControllerMock()
		coordinator = InputIMCCoordinator(navigation: spy)
		sutMock = InputIMCFactory.make(coordinator: coordinator)
	}
	
	func buildSut() -> InputIMCCoordinator {
		let sut = InputIMCCoordinator(navigation: spy)
		
		return sut
	}
	
	func test_navigateToResultIMC() {
		
		// when
		let sut = buildSut()
		let result = ResultIMCModel(height: 100, weight: 100)
		
		//given
		sut.navigateToResultIMC(result: result)
		
		//then
		XCTAssertTrue(spy.pushViewControllerTesting)
	}

    override func tearDown() {
		sutMock = nil
		coordinator = nil
	}
	
	// MARK: - Bellow are just experiments

    func test_DidTapCalculateButton() {
		XCTAssertNotNil(sutMock.didTapCalculateButton())
	}
	
	func test_IsValidInputAlert() {

		let result: () = coordinator.navigateToResultIMC(result: ResultIMCModel(height: 100, weight: 100))

		XCTAssertNotNil(result)
	}
}


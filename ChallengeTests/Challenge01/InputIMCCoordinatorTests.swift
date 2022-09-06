//
//  InputIMCCoordinator.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class InputIMCCoordinatorTests: XCTestCase {
	
	var sut: InputIMCController!
	var coordinator: InputIMCCoordinator!

    override func setUp() {
		let navigation = UINavigationController(
			rootViewController: UIViewController())
		
		coordinator = InputIMCCoordinator(navigation: navigation)
		sut = InputIMCFactory.make(coordinator: coordinator)
	}

    override func tearDown() {
		sut = nil
		coordinator = nil
	}

    func test_DidTapCalculateButton() {
		sut.didTapCalculateButton()
	}
	
	func test_IsValidInputAlert() {
		sut.isValidInputAlert(title: "", message: "")
		
		let result: () = coordinator.navigateToResultIMC(result: ResultIMCModel(height: 100, weight: 100))
		
		XCTAssertNotNil(result)
	}
}

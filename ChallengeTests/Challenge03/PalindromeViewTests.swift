//
//  PalindromeViewTest.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 21/09/22.
//

import XCTest
@testable import Challenge

final class PalindromeViewTests: XCTestCase {
	
	
	func buildSut() -> PalindromeView {
		let sut = PalindromeView()
		
		return sut
	}
	
	func buildVC() -> MockViewController {
		let vc = MockViewController(nibName: nil, bundle: nil)
		return vc
	}
	
	// TODO: - test it in UI test
	func test_getInputedText_when_view_load() {
		
		// when
		let sut = buildSut()
		
		// given
		let expectedValue = ""
		
		// then
		XCTAssertEqual(sut.getInputedText, expectedValue)
	}

	
}
	
	// MARK: - Mocks

class MockViewController: UIViewController {
	
	override func loadView() {
		setupView()
	}
	
	func setupView() {
		let customView = PalindromeView()
		view = customView
	}
}


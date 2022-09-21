//
//  MainCoordinatorNavigationTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 20/09/22.
//

import XCTest
@testable import Challenge

final class MainCoordinatorNavigationTests: XCTestCase {

	func buildSut() -> MainCoordinatorMock {
		let sut = MainCoordinatorMock(navigation: UINavigationController())
		
		return sut
	}
	
	func test_navigateToSceneIndex_Zero() {
		let sut = buildSut()
		sut.navigateTo(sceneIndex: 0)
		
		XCTAssertEqual(sut.sceneIndex, 0)
	}
	
	func test_navigateToSceneIndex_One() {
		let sut = buildSut()
		sut.navigateTo(sceneIndex: 1)
		
		XCTAssertEqual(sut.sceneIndex, 1)
	}
	
	func test_navigateToSceneIndex_Two() {
		let sut = buildSut()
		sut.navigateTo(sceneIndex: 2)
		
		XCTAssertEqual(sut.sceneIndex, 2)
	}
	
	func test_navigateToSceneIndex_Three() {
		let sut = buildSut()
		sut.navigateTo(sceneIndex: 3)
		
		XCTAssertEqual(sut.sceneIndex, 3)
	}
}


class MainCoordinatorMock: MainCoordinatorProtocol {
	
	var childCoordinators: [Challenge.Coordinator] = []
	
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() { }
	
	var sceneIndex: Int?
	
	func navigateTo(sceneIndex: Int) {
		self.sceneIndex = sceneIndex
	}
}

//
//  MainCoordinatorTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class MainCoordinatorTests: XCTestCase {
	
	var sut: MainController!
	var coordinator: MainCoordinator!
	var delegate: TableViewDelegate?
	
	var coordinatorMock: MainCoordinatorMock!
	var navigation: NavigationControllerMock!
	
	override func setUp() {
		navigation = NavigationControllerMock()
		coordinator = MainCoordinator(navigation: navigation)
		sut = MainFactory.make(coordinator: coordinator)
		coordinatorMock = MainCoordinatorMock(navigation: navigation)
	}

	func test_pushViewController() {
		navigation.pushViewController(UIViewController(), animated: false)
		XCTAssertTrue(navigation.pushViewControllerTesting)
	}
	
	func test_start() {
		XCTAssertFalse(coordinatorMock.startVC)
		coordinatorMock.start()
		XCTAssertTrue(coordinatorMock.startVC)
	}
	
	func test_navigateTo() {
		XCTAssertFalse(coordinatorMock.navigateTo)
		coordinatorMock.navigateTo(sceneIndex: 1)
		
		XCTAssertEqual(coordinatorMock.sceneIndex, 1)
		XCTAssertTrue(coordinatorMock.navigateTo)
	}
	
	func test_DidSelectCell() {
		XCTAssertNotNil(sut.didSelectCell(item: 0))
		XCTAssertNotNil(sut.didSelectCell(item: 1))
		XCTAssertNotNil(sut.didSelectCell(item: 2))
		XCTAssertNotNil(sut.didSelectCell(item: 3))
		XCTAssertNotNil(sut.didSelectCell(item: 999))
	}
	
	func test_NavigateTo() {
		XCTAssertNotNil(coordinator.navigateTo(sceneIndex: 0))
		XCTAssertNotNil(coordinator.navigateTo(sceneIndex: 1))
		XCTAssertNotNil(coordinator.navigateTo(sceneIndex: 2))
		XCTAssertNotNil(coordinator.navigateTo(sceneIndex: 3))
		XCTAssertNotNil(coordinator.navigateTo(sceneIndex: 999))
	}
	
	func test_didSelectRowAt() {
		delegate?.tableView(UITableView(), didSelectRowAt: IndexPath())
	}
	
	override func tearDown() {
		sut = nil
		coordinator = nil
	}
}

// MARK: - Mocks

class MainCoordinatorMock: MainCoordinatorProtocol {
	
	var childCoordinators: [Challenge.Coordinator] = []
	var navigation: UINavigationController
	var navigateTo = false
	var startVC = false
	var sceneIndex: Int?
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		self.startVC = true
	}
	
	func navigateTo(sceneIndex: Int) {
		self.sceneIndex = sceneIndex
		self.navigateTo = true
	}
}

class NavigationControllerMock: UINavigationController {
	var pushViewControllerTesting: Bool = false
	
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		super.pushViewController(viewController,
								 animated: animated)
		
		pushViewControllerTesting = true
	}
}


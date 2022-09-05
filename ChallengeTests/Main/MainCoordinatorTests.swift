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
	
	override func setUp() {
		let navigation = UINavigationController(
			rootViewController: UIViewController())
		coordinator = MainCoordinator(navigation: navigation)
		sut = MainFactory.make(coordinator: coordinator)
	}
	
	override func tearDown() {
		sut = nil
		coordinator = nil
	}
	
	func test_DidSelectCell()  {
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
}

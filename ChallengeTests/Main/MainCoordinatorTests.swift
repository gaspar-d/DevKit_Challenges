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
	
	var spy = NavigationControllerMock()
	
	func buildSut() -> MainCoordinator {
		let sut = MainCoordinator(navigation: spy)
		
		return sut
	}
	
	func test_navigateToSceneIndex() {
		let sut = buildSut()
		let sceneIndex = 1
		
		sut.navigateTo(sceneIndex: sceneIndex)
		XCTAssertTrue(spy.pushViewControllerTesting)
	}
	
	// MARK: - MainCoordinator
	let inputCoordinator = InputIMCCoordinator(navigation: NavigationControllerMock())
	
	func test_navigateToIndexZero() {

		// Given
		let scene = 0
		
		// When
		coordinator.navigateTo(sceneIndex: scene)
		inputCoordinator.start()
		
		// Then
		XCTAssertEqual(spy.pushViewControllerTesting, true)
	}
	
	func test_navigateToIndexOne() {
		
		// when
		let scene = 1
		
		// given
		coordinator.navigateTo(sceneIndex: scene)
		inputCoordinator.start()
		
		// then
		XCTAssertEqual(spy.pushViewControllerTesting, true)
		
	}
	
	func test_navigateToIndexTwo() {
		
		// when
		let scene = 2
		
		// given
		coordinator.navigateTo(sceneIndex: scene)
		inputCoordinator.start()
		
		// then
		XCTAssertEqual(spy.pushViewControllerTesting, true)
	}
	
	func test_navigateToIndexThree() {
		
		// when
		let scene = 3
		
		// given
		coordinator.navigateTo(sceneIndex: scene)
		inputCoordinator.start()
		
		// then
		XCTAssertEqual(spy.pushViewControllerTesting, true)
	}
	
	// MARK: - Controller
	
	override func setUp() {
		spy = NavigationControllerMock()
		coordinator = MainCoordinator(navigation: spy)
		sut = MainFactory.make(coordinator: coordinator)
	}
	
	func test_pushViewController() {
		spy.pushViewController(UIViewController(), animated: false)
		XCTAssertTrue(spy.pushViewControllerTesting)
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


//
//  MainControllerTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 02/09/22.
//

import XCTest
@testable import Challenge

class MainControllerTests: XCTestCase {

	var sutMock = TableControllerMock()
	var datasource: TableViewDataSource?
	var delegate: TableViewDelegate?
	var tableView: UITableView!
	
	override func setUp() {
		tableView = UITableView()
		tableView.register(UITableViewCell.self,
						   forCellReuseIdentifier: CellIdentifier.cell)
		tableView.dataSource = datasource
		tableView.delegate = delegate
		datasource = TableViewDataSource(withData: ["Joe", "Doe"])
		delegate = TableViewDelegate(
			withDelegate: MainFactory.make(
				coordinator: MainCoordinator(
				navigation: UINavigationController())))
	}
	
	func test_didSelectCell() {
		XCTAssertEqual(sutMock.didSelectCell, false)
		sutMock.didSelectCell(item: 1)
		
		XCTAssertEqual(sutMock.didSelectCell, true)
		XCTAssertEqual(sutMock.item, 1)
		XCTAssertTrue(sutMock.didSelectCell)
	}
	
	func test_didSelectRowAt() {
		let indexPath = IndexPath(item: 0, section: 0)
		delegate?.tableView(tableView, didSelectRowAt: indexPath)
		
		XCTAssertEqual(datasource?.data, ["Joe", "Doe"])
	}
	
	func test_initCoder() {
		// TODO: - FatalError???
		let sutInit = MainController(coder: NSCoder())
		XCTAssertNil(sutInit)
	}
	
	override func tearDown() {
		tableView = nil
		datasource = nil
		delegate = nil
	}
}

// MARK: - Mocks

class TableControllerMock: TableControllerDelegate {
	var didSelectCell: Bool = false
	var item: Int? = nil
	
	func didSelectCell(item: Int) {
		didSelectCell = true
		self.item = item
	}
}

//
//  AlertsTests.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 05/09/22.
//

import XCTest
@testable import Challenge

class AlertsTests: XCTestCase {
	
	let sutMock = AlertsMock()
	let sut = Alerts()
	
	func test_popupAssertEmptyString() {
		XCTAssertNotNil(sut.popup(title: "", message: "", controller: UIViewController()))
	}
	
	func test_popupAssertEmptyMessage() {
		sutMock.popup(title: "test title", message: "", controller: UIViewController())
		
		XCTAssertEqual(sutMock.title, "test title")
		XCTAssertEqual(sutMock.message, "")
	}
	
	func test_popupAssertEmptyTitle() {
		sutMock.popup(title: "", message: "test message", controller: UIViewController())
		
		XCTAssertEqual(sutMock.title, "")
		XCTAssertEqual(sutMock.message, "test message")
	}
	
	func test_popupAssertAllFilled() {
		sutMock.popup(title: "test title", message: "test message", controller: UIViewController())
		
		XCTAssertEqual(sutMock.title, "test title")
		XCTAssertEqual(sutMock.message, "test message")
	}
}

class AlertsMock: AlertsProtocol {
	
	var title: String? = nil
	var message: String? = nil
	var controller: UIViewController? = nil
	
	func popup(title: String, message: String, controller: UIViewController) {
		
		self.title = title
		self.message = message
		self.controller = controller
	}
}

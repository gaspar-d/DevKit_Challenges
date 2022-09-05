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
	
	func test_popup() {
		
		XCTAssertNotNil(sut.popup(title: "", message: "", controller: UIViewController()))
		
		XCTAssertFalse(sutMock.popup)
		
		sutMock.popup(title: "test title", message: "test message", controller: UIViewController())
		
		XCTAssertEqual(sutMock.title, "test title")
		XCTAssertEqual(sutMock.message, "test message")
		XCTAssertTrue(sutMock.popup)
	}
}

class AlertsMock: AlertsProtocol {
	
	var title: String? = nil
	var message: String? = nil
	var controller: UIViewController? = nil
	var popup: Bool = false
	
	func popup(title: String, message: String, controller: UIViewController) {
		
		self.popup = true
		self.title = title
		self.message = message
		self.controller = controller
	}
}

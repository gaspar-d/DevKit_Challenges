//
//  NavigationControllerMock.swift
//  ChallengeTests
//
//  Created by Diogo Gaspar on 19/09/22.
//

import XCTest

class NavigationControllerMock: UINavigationController {
	var pushViewControllerTesting: Bool = false
	var presentControllerTesting: Bool = false
	
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		
		pushViewControllerTesting = true
	}
	
	override func present(_ viewControllerToPresent: UIViewController,
						  animated flag: Bool,
						  completion: (() -> Void)? = nil) {
		
		presentControllerTesting = true
	}
}


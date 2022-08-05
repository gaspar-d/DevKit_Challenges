//
//  PalindromeCoordinator.swift
//  Challenge
//
//  Created by Diogo Gaspar on 03/08/22.
//

import UIKit
import SafariServices

protocol PalindromeCoordinatorProtocol: AnyObject {
	func navigateToPalindromeDescription()
}

final class PalindromeCoordinator: Coordinator {
	public var childCoordinators: [Coordinator] = []
	public var navigation: UINavigationController
	private let url = URL(string: "https://pt.wikipedia.org/wiki/Pal%C3%ADndromo")!
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = PalindromeFactory.make(coordinator: self)
		navigation.pushViewController(vc, animated: true)
	}
}

extension PalindromeCoordinator: PalindromeCoordinatorProtocol {
	
	func navigateToPalindromeDescription() {
		let vc = SFSafariViewController(url: url)
		
		navigation.present(vc, animated: true)
	}
}

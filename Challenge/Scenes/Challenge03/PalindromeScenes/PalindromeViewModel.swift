//
//  PalindromeViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 04/08/22.
//

import Foundation

protocol PalindromeViewModelProtocol: AnyObject {
	func navigateToPalindromeDescription()
}

final class PalindromeViewModel: NSObject {
	weak var coordinator: PalindromeCoordinatorProtocol?
}

extension PalindromeViewModel: PalindromeViewModelProtocol {
	
	public func navigateToPalindromeDescription() {
		coordinator?.navigateToPalindromeDescription()
	}
}

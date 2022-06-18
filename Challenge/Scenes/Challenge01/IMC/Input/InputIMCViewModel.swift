//
//  InputIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

protocol InputIMCViewModelProtocol: AnyObject {
	func navigateToResult()
}

final class InputIMCViewModel: NSObject {
	var coordinator: InputMVCCoordinator?
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	func navigateToResult() {
		coordinator?.navigateToIMC()
	}
}

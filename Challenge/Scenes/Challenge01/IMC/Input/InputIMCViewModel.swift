//
//  InputIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

protocol InputIMCViewModelProtocol: AnyObject {
	func navigateToResult(result: ResultIMCModel)
}

final class InputIMCViewModel: NSObject {
	weak var coordinator: InputMVCCoordinator?
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	
	public func navigateToResult(result: ResultIMCModel) {
		coordinator?.navigateToResultIMC(result: result)
	}
}

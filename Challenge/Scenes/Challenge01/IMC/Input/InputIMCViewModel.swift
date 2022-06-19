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
	var coordinator: InputMVCCoordinator?
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	
	func setData() {
		
	}
	
	func navigateToResult(result: ResultIMCModel) {
		coordinator?.navigateToResultIMC(result: result)
	}
}

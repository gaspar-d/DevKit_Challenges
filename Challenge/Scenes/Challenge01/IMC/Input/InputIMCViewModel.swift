//
//  InputIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

protocol InputIMCViewModelProtocol: AnyObject {
	func navigateToResult()
	func didFinishInput()
}

final class InputIMCViewModel: NSObject {
	var coordinator: InputMVCCoordinator?
}

extension InputIMCViewModel: InputIMCViewModelProtocol {
	func navigateToResult() {
//		coordinator?.navigateToIMC()
		
//		coordinator?.navigate(to: 1)
		
		print("Pressed", #line)
		
		coordinator?.navigateToResult()

		
	}
	
	func didFinishInput() {
		coordinator?.didFinishInput()
	}

}

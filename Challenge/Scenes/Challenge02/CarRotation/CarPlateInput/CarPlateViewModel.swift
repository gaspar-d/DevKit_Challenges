//
//  CarPlateViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

protocol CarPlateViewModelProtocol: AnyObject {
	func navigateTo()
}

final class CarPlateViewModel: NSObject {
	
	weak var coordinator: CarRotationCoordinator?
	
	
}

extension CarPlateViewModel: CarPlateViewModelProtocol {
	func navigateTo() {
		coordinator?.navigateToCarRotationResult()
	}
}

//
//  CarRotationViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

protocol CarRotationViewModelProtocol: AnyObject {
	var getPlateNumber: String? { get }
}

final class CarRotationViewModel: NSObject {
	
	weak var coordinator: CarRotationCoordinator?
	var plate: String?
}

extension CarRotationViewModel: CarRotationViewModelProtocol {
	var getPlateNumber: String? {
		self.plate
	}
}

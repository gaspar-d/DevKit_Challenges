//
//  CarRotationViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import Foundation

protocol CarRotationViewModelProtocol: AnyObject {
	var getPlateNumber: String? { get }
	var getLastCharacterOfPlate: String { get }
}

final class CarRotationViewModel: NSObject {
	
	weak var coordinator: CarRotationCoordinator?
	var plate: String?
}

extension CarRotationViewModel: CarRotationViewModelProtocol {
	var getPlateNumber: String? {
		self.plate
	}
	
	var getLastCharacterOfPlate: String {
		guard let plate = self.plate?.last else { return "" }
		let single = String(plate)
		return single
	}
	
	
	// TODO: - enum with week days && get system time to make the switch
	
//	hoje
//	amanhã
//	depois de amanhã
//	daqui 3 dias
}

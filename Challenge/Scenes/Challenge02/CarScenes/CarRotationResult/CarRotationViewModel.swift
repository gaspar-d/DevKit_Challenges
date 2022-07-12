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
	
	func getWeekday(with digit: String) -> String
	func getRotationPerTime(with weekday: String) -> String
}

final class CarRotationViewModel: NSObject {
	
	public weak var coordinator: CarRotationCoordinator?
	public var plate: String?
}

extension CarRotationViewModel: CarRotationViewModelProtocol {
	public var getPlateNumber: String? {
		self.plate
	}
	
	public var getLastCharacterOfPlate: String {
		guard let plate = self.plate?.last else { return "" }
		let single = String(plate)
		return single
	}
	
	public func getWeekday(with digit: String) -> String {
		guard let digit = Int(getLastCharacterOfPlate) else { return "" }
		
		var weekday: String
		
		switch digit {
		case 1...2:
			weekday = "segunda-feira"
		case 3...4:
			weekday = "terça-feira"
		case 5...6:
			weekday = "quarta-feira"
		case 7...8:
			weekday = "quinta-feira"
		case 9:
			weekday = "sexta-feira"
		default:
			weekday = "sexta-feira"
		}
		
		return weekday
	}
	
	public func getRotationPerTime(with weekday: String) -> String {
		
		var rotationDay: String = ""
		
		guard var current = Calendar.current.date(byAdding: .weekday,
												  value: 0,
												  to: .now)
		else {
			return "ERROR: cannot fetch system time"
		}
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEEE"
		var systemWeekday = dateFormatter.string(from: current)
		
		if weekday == systemWeekday {
			rotationDay = "Hoje"
		}
		
		if weekday != systemWeekday {
			current = Calendar.current.date(byAdding: .weekday, value: 1, to: .now)!
			systemWeekday = dateFormatter.string(from: current)
			
			if weekday == systemWeekday {
				rotationDay = "Amanhã"
			}
		}

		if weekday != systemWeekday {
			current = Calendar.current.date(byAdding: .weekday, value: 2, to: .now)!
			systemWeekday = dateFormatter.string(from: current)
			
			if weekday == systemWeekday {
				rotationDay = "Depois de Amanhã"
			}
		}

		if weekday != systemWeekday {
			current = Calendar.current.date(byAdding: .weekday, value: 3, to: .now)!
			systemWeekday = dateFormatter.string(from: current)
			
			if weekday == systemWeekday {
				rotationDay = "Daqui a três dias"
			}
		}
		
		if weekday != systemWeekday {
			rotationDay = ""
		}
		
		return rotationDay
	}
}


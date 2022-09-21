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
		var weekDayAsInt: Int
		
		switch weekday {
		case "segunda-feira":
			weekDayAsInt = 2
		case "terça-feira":
			weekDayAsInt = 3
		case "quarta-feira":
			weekDayAsInt = 4
		case "quinta-feira":
			weekDayAsInt = 5
		case "sexta-feira":
			weekDayAsInt = 6
		default:
			fatalError("ERROR: Can't get a weekday number")
		}
		
		var rotationDay: String = ""
		
		guard var systemWeekday = Calendar.current.dateComponents([.weekday], from: .now).weekday else { return "não pegou o dia de hoje"}
		
		if weekDayAsInt == systemWeekday {
			rotationDay = "Hoje"
		}
		
		if weekDayAsInt != systemWeekday {
			systemWeekday += 1
			
			if weekDayAsInt == systemWeekday {
				rotationDay = "Amanhã"
			}
		}

		if weekDayAsInt != systemWeekday {
			systemWeekday += 1
			
			if weekDayAsInt == systemWeekday {
				rotationDay = "Depois de Amanhã"
			}
		}

		if weekDayAsInt != systemWeekday {
			systemWeekday += 1
			
			if weekDayAsInt == systemWeekday {
				rotationDay = "Daqui a três dias"
			}
		}
		
		return rotationDay
	}
}


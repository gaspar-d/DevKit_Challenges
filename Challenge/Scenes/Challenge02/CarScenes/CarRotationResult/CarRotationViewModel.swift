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
//			weekday = "segunda-feira"
			weekday = "Monday"
//			weekday = 2
		case 3...4:
			weekday = "terça-feira"
//			weekday = 3
		case 5...6:
			weekday = "quarta-feira"
//			weekday = 4
		case 7...8:
			weekday = "quinta-feira"
//			weekday = 5
		case 9:
			weekday = "sexta-feira"
//			weekday = 6
		default:
			weekday = "sexta-feira"
//			weekday = 6
		}
		
		print(#line, "----------------->", weekday)
		return weekday
	}
	
	public func getRotationPerTime(with weekday: String) -> String {
		
		var rotationDay: String = ""
		
		guard let test = Calendar.current.dateComponents([.weekday], from: .now).weekday else { return "não pegou o dia de hoje"}
		print(#line, "----------------->", test, type(of: test))
		
		guard var current = Calendar.current.date(byAdding: .weekday,
												  value: 0,
												  to: .now)
		else {
			return "ERROR: cannot fetch system time"
		}
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEEE"
		var systemWeekday = dateFormatter.string(from: current)
		print(#line, "----------------->", systemWeekday)
		
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
			rotationDay = "rotationDay vazio"
		}
		
		print(#line, "----------------->", rotationDay)
		return rotationDay
	}
}


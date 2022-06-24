//
//  ResultIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import UIKit

enum IMC: Float {
	case underWeight = 18.5
	case normal = 24.9
	case overWeight = 29.9
	case obesity1 = 34.9
	case obesity2 = 39.9
	case obesity3 = 40
}

protocol ResultIMCViewModelProtocol: AnyObject {
	var getResult: String? { get }
	var image: UIImage? { get }
	var color: UIColor? { get }
	var classification: String? { get }
}

final class ResultIMCViewModel: NSObject {
	
	weak var coordinator: InputMVCCoordinator?
	private var model: ResultIMCModel
	
	private var result: Float = 0
	private(set) var image: UIImage?
	private(set) var color: UIColor?
	private(set) var classification: String?
	
	init(model: ResultIMCModel) {
		self.model = model
		super.init()
		
		self.setupData()
	}
	
	private func setupData() {
		result = model.weight / (model.height * model.height) * 10000
		
		switch result {
		case let result where result <= IMC.underWeight.rawValue:
			image = UIImage(systemName: "person.crop.circle.badge.minus")
			color = UIColor.cyan
			classification = "Abaixo do normal"
			
		case let result where result <= IMC.normal.rawValue:
			image = UIImage(systemName: "person.crop.circle.badge.checkmark")
			color = UIColor.systemGreen
			classification = "Normal"
			
		case let result where result <= IMC.overWeight.rawValue:
			image = UIImage(systemName: "person.crop.circle.badge.plus")
			color = UIColor.blue
			classification = "Sobrepeso"
			
		case let result where result <= IMC.obesity1.rawValue:
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemYellow
			classification = "Obesidade grau 1"
			
		case let result where result <= IMC.obesity2.rawValue:
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemOrange
			classification = "Obesidade grau 2"
			
		case let result where result >= IMC.obesity3.rawValue:
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemRed
			classification = "Obesidade grau 3"
			
		default:
			print("Impossible to compute the data in setupData method")
		}
	}
}

extension ResultIMCViewModel: ResultIMCViewModelProtocol {
	public var getResult: String? {
		String(format: "%.1f", result)
	}
}

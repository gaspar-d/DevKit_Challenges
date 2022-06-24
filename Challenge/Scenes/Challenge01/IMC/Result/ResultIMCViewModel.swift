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
		
		if result <= IMC.underWeight.rawValue {
			image = UIImage(systemName: "person.crop.circle.badge.minus")
			color = UIColor.cyan
			classification = "Abaixo do normal"
		}
		else if result <= IMC.normal.rawValue {
			image = UIImage(systemName: "person.crop.circle.badge.checkmark")
			color = UIColor.systemGreen
			classification = "Normal"
		}
		else if result <= IMC.overWeight.rawValue {
			image = UIImage(systemName: "person.crop.circle.badge.plus")
			color = UIColor.blue
			classification = "Sobrepeso"
		}
		else if result <= IMC.obesity1.rawValue {
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemYellow
			classification = "Obesidade grau 1"
		}
		else if result <= IMC.obesity2.rawValue {
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemOrange
			classification = "Obesidade grau 2"
		}
		else if result >= IMC.obesity3.rawValue {
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemRed
			classification = "Obesidade grau 3"
		}
	}
}

extension ResultIMCViewModel: ResultIMCViewModelProtocol {
	public var getResult: String? {
		String(format: "%.1f", result)
	}
}

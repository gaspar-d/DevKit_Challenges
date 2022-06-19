//
//  ResultIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import Foundation
import UIKit

// TODO: - Thinking about how to use a enum in this.
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
	var getColor: UIColor? { get }
	var getClassification: String? { get }
}

final class ResultIMCViewModel: NSObject {
	
	var coordinator: InputMVCCoordinator?
	private var model: ResultIMCModel
	private var result: Float?
	
	init(model: ResultIMCModel) {
		self.model = model
		
	}
	
	private var setResult: Float {
		model.weight / (model.height * model.height) * 10000
	}
}

extension ResultIMCViewModel: ResultIMCViewModelProtocol {
	public var getResult: String? {
		String(format: "%.1f", setResult)
	}
	
	public var getColor: UIColor? {
		var color: UIColor?
		
		if setResult <= 18.5 {
			print("Abaixo do normal")
			color = UIColor.cyan
		}
		else if setResult <= 24.9 {
			print("Normal")
			color = UIColor.blue
		}
		else if setResult <= 29.9 {
			print("Sobrepeso")
			color = UIColor.systemGreen
		}
		else if setResult <= 34.9 {
			print("Obesidade grau 1")
			color = UIColor.systemYellow
		}
		else if setResult <= 39.9 {
			print("Obesidade grau 2")
			color = UIColor.systemOrange
		}
		else if setResult >= 40 {
			print("Obesidade grau 3")
			color = UIColor.systemRed
		}
		
		guard let color = color else {
			return UIColor.purple
		}
		
		return color
	}
	
	public var getClassification: String? {
		var classification: String? = ""
		
		if setResult <= 18.5 {
			classification = "Abaixo do normal"
		}
		else if setResult <= 24.9 {
			classification = "Normal"
		}
		else if setResult <= 29.9 {
			classification = "Sobrepeso"
		}
		else if setResult <= 34.9 {
			classification = "Obesidade grau 1"
		}
		else if setResult <= 39.9 {
			classification = "Obesidade grau 2"
		}
		else if setResult >= 40 {
			classification = "Obesidade grau 3"
		}

		guard let classification = classification else {
			return "Failed to get classification"
		}

		return classification
	}
}

// MARK: - Reference IMC
// 18,5 - 0 -> Abaixo do Normal
// 24,9 - 18,6 -> Normal
// 29,9 - 25,0 -> Sobrepeso
// 34,9 - 30,0 -> Obesidade grau 1
// 35,0 - 39,9 -> Obesidade grau 2
// 40+ -> Obesidade grau 3

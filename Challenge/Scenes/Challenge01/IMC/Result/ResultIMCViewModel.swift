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
	var getImage: UIImage? { get }
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
	
	// TODO: - Transform all this in just one method that config all options at once
	
	public var getImage: UIImage? {
		var image: UIImage?
		
		if setResult <= 18.5 {
			image = UIImage(systemName: "person.crop.circle.badge.minus")
		}
		else if setResult <= 24.9 {
			image = UIImage(systemName: "person.crop.circle.badge.checkmark")
		}
		else if setResult <= 29.9 {
			image = UIImage(systemName: "person.crop.circle.badge.plus")
		}
		else if setResult <= 34.9 {
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
		}
		else if setResult <= 39.9 {
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
		}
		else if setResult >= 40 {
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
		}
		
		guard let image = image else {
			return UIImage(systemName: "person.crop.circle.badge.checkmark")
		}
		
		return image
	}
	
	public var getColor: UIColor? {
		var color: UIColor?
		
		if setResult <= 18.5 {
			color = UIColor.cyan
		}
		else if setResult <= 24.9 {
			color = UIColor.blue
		}
		else if setResult <= 29.9 {
			color = UIColor.systemGreen
		}
		else if setResult <= 34.9 {
			color = UIColor.systemYellow
		}
		else if setResult <= 39.9 {
			color = UIColor.systemOrange
		}
		else if setResult >= 40 {
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

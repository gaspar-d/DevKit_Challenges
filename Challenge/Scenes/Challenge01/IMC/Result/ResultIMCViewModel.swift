//
//  ResultIMCViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 18/06/22.
//

import UIKit

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
		case 0...18.5:
			image = UIImage(systemName: "person.crop.circle.badge.minus")
			color = UIColor.cyan
			classification = "Abaixo do normal"
			
		case 18.6...24.9:
			image = UIImage(systemName: "person.crop.circle.badge.checkmark")
			color = UIColor.systemGreen
			classification = "Normal"
			
		case 25...29.9:
			image = UIImage(systemName: "person.crop.circle.badge.plus")
			color = UIColor.blue
			classification = "Sobrepeso"
			
		case 30...34.9:
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemYellow
			classification = "Obesidade grau 1"
			
		case 35...39.9:
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemOrange
			classification = "Obesidade grau 2"
			
		default:
			image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
			color = UIColor.systemRed
			classification = "Obesidade grau 3"
			print("Impossible to compute the data in setupData method")
		}
	}
}

extension ResultIMCViewModel: ResultIMCViewModelProtocol {
	public var getResult: String? {
		String(format: "%.1f", result)
	}
}

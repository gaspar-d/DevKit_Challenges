//
//  CarPlateViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarPlateController: UIViewController {

	private var customView: CarPlateView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	func setupView() {
		customView = CarPlateView()
		self.view = customView
	}
}

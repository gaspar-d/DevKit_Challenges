//
//  CarRotationViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarRotationController: UIViewController {

	private var customView: CarRotationView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	private func setupView() {
		customView = CarRotationView()
		self.view = customView
	}
}

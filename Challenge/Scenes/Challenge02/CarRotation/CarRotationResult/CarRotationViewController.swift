//
//  CarRotationViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarRotationController: UIViewController {
	
	private var customView: CarRotationView?
	var viewModel: CarRotationViewModelProtocol?
	
	init(viewModel: CarRotationViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupPlateLabel()
	}
	
	private func setupView() {
		customView = CarRotationView()
		self.view = customView
	}
	
	private func setupPlateLabel() {
		guard let plate = viewModel?.getPlateNumber,
			  !plate.isEmpty else { return }
		
		customView?.setPlateLabel(plate: plate)
	}
}

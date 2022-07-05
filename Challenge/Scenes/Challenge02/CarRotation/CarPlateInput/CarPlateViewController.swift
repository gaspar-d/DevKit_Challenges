//
//  CarPlateViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarPlateController: UIViewController {

	private var customView: CarPlateView?
	var viewModel: CarPlateViewModelProtocol
	
	init(viewModel: CarPlateViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupButtonAction()
	}
	
	func setupView() {
		customView = CarPlateView()
		self.view = customView
	}
	
	private func setupButtonAction() {
		customView?.plateButtonAction(target: self, action: #selector(didTapPlateButton))
	}
	
	@objc private func didTapPlateButton() {
		viewModel.navigateTo()
		print("Opa")
	}
}
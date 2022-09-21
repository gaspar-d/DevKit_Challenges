//
//  CarRotationViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarRotationController: UIViewController {
	
	private var customView: CarRotationViewProtocol?
	private var viewModel: CarRotationViewModelProtocol?
	
	init(customView: CarRotationViewProtocol,
		 viewModel: CarRotationViewModelProtocol)
	{
		self.customView = customView
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
		setupButtonAction()
		setupNavigationBar()
	}
	
	// MARK: - methods
	private func setupView() {
		self.view = customView as? UIView
	}
	
	private func setupNavigationBar() {
		title = "Seu rodízio"
		navigationItem.hidesBackButton = true
		
		let backButton = UIBarButtonItem(barButtonSystemItem: .cancel,
										 target: self,
										 action: #selector(didTapBackButton))
		backButton.tintColor = .label
		
		navigationItem.rightBarButtonItem = backButton
	}
	
	@objc private func didTapBackButton() {
		navigationController?.popToRootViewController(animated: true)
	}
	
	private func setupPlateLabel() {
		guard let plate = viewModel?.getPlateNumber,
			  let digit = viewModel?.getLastCharacterOfPlate,
			  let weekday = viewModel?.getWeekday(with: digit),
			  let rotationTime = viewModel?.getRotationPerTime(with: weekday),
			  !plate.isEmpty else { return }
		
		customView?.setRotationDayLabel(with: rotationTime)
		customView?.setWeekdayLabel(with: weekday)
		
	}
	
	private func setupButtonAction() {
		customView?.setNewQueryButtonAction(target: self, action: #selector(didTapNewQueryButton))
	}
	
	@objc private func didTapNewQueryButton() {
		navigationController?.popViewController(animated: true)
	}
}

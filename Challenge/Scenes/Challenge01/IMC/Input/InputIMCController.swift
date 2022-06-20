//
//  InputIMCController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class InputIMCController: UIViewController {
	
	private var customView: InputIMCView?
	public var viewModel: InputIMCViewModelProtocol
	
	init(viewModel: InputIMCViewModelProtocol) {
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
		setupSliderAction()
		setupNavigationBar()
	}
	
	private func setupView() {
		customView = InputIMCView()
		view = customView
	}
	
	private func setupNavigationBar() {
		title = "Calculadora de IMC"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func setupButtonAction() {
		customView?.buttonAction(target: self, action: #selector(didTapCalculateButton))
	}
	
	@objc func didTapCalculateButton() {
		guard let height = customView?.getInputHeight,
			  let weight = customView?.getInputWeight
		else {
			return
		}
		
		viewModel.navigateToResult(result: ResultIMCModel(height: height, weight: weight))
	}
	
	private func setupSliderAction() {
		customView?.heightSliderChanged(target: self, action: #selector(heightSliderDidChange))
		
		customView?.weightSliderChanged(target: self, action: #selector(weightSliderDidChange))
	}
	
	@objc private func heightSliderDidChange(_ sender: UISlider!) {
		DispatchQueue.main.async {
			self.customView?.updateHeightNumber()
		}
	}
	
	@objc private func weightSliderDidChange(_ sender: UISlider) {
		DispatchQueue.main.async {
			self.customView?.updateWeightNumber()
		}
	}
}
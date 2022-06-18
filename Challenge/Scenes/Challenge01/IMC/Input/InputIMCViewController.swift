//
//  InputIMCViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class InputIMCViewController: UIViewController {
	
	private var customView: InputView?
	var viewModel: InputIMCViewModelProtocol

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
		didTapButton()
	}
	
	private func setupView() {
		customView = InputView()
		view = customView
		
		title = "IMC Calculator"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func didTapButton() {
		customView?.buttonAction(target: self, action: #selector(navigateToNextScene))
	}
	
	@objc func navigateToNextScene() {
		viewModel.navigateToResult()
		
	}
}

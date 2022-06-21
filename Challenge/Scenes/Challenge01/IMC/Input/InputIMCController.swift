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
		
		if height.isEmpty || weight.isEmpty {
			isValidInputAlert(title: "Opa faltou digitar algo?",
							  message: "Por favor preencha todos os campos \n para podermos calcular seu IMC")
		}
		
		let result = viewModel.validateUserInput(height: height, weight: weight)
		
		if result.weight < 15 || result.weight > 150 {
			isValidInputAlert(title: "Peso fora do limite aceito pelo App",
							  message: "O peso precisa estar entre 15 e 150kg")
			
		} else if result.height < 100 || result.height > 210 {
			isValidInputAlert(title: "Altura fora do limite aceito pelo App",
							  message: "A altura precisa estar entre 100 e 210 centímetros.")
		}
		
		viewModel.navigateToResult(result: result)
	}
	
	func isValidInputAlert(title: String, message: String) {
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let cancel = UIAlertAction(title: "OK", style: .cancel)
		
		alert.addAction(cancel)
		present(alert, animated: true)
	}
}

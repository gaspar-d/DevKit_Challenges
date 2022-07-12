//
//  CarPlateViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarPlateController: UIViewController {
	
	private var customView: CarPlateView?
	private var viewModel: CarPlateViewModelProtocol
	
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
		customView?.setTextFieldDelegate(delegate: self)
	}
	
	private func setupView() {
		title = "Rodízio Automotivo SP"
		
		customView = CarPlateView()
		self.view = customView
	}
	
	private func setupButtonAction() {
		customView?.setPlateButtonAction(target: self,
										 action: #selector(didTapPlateButton))
	}
	
	@objc private func didTapPlateButton() {
		guard let plate = customView?.getPlateInput else {
			return
		}
		
		if viewModel.isPlateFieldEmpty(with: plate) {
			isValidInputAlert(title: "Campo vazio",
							  message: "Insira a numeração de sua placa para prosseguir")
		}

		if viewModel.isPlateValid(with: plate) {
			isValidInputAlert(title: "Placa com números faltantes",
							  message: "Ambas placas modelo Mercosul e antiga precisam de 7 dígitos")
		}
		
		if viewModel.isPlateFormatCorrect(with: plate) {
			isValidInputAlert(title: "Placa em formato inválido",
							  message: "Placas tem formato: \n (mercosul) XXX 0X00\n (antigo) XXX 0000")
		}
		
		viewModel.navigateToCarRotation(with: plate)
		customView?.cleanPlateField()
	}
	
	private func isValidInputAlert(title: String, message: String) {
		let alert = UIAlertController(title: title,
									  message: message,
									  preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "Ok", style: .destructive)
		alert.addAction(okAction)
		
		present(alert, animated: true)
	}
}

extension CarPlateController: UITextFieldDelegate, TextFieldLimiter {
	
	public func textField(_ textField: UITextField,
				   shouldChangeCharactersIn range: NSRange,
				   replacementString string: String) -> Bool {
		
		var removeExtraCharacters = textField.text?
			.replacingOccurrences(of: " ", with: "")
		
		textField.text = removeExtraCharacters?.applyPatternOnString(pattern:"### ####",
																	 replacementCharacter: "#")
		
		return textLimit(textField.text ?? "", newText: string, limit: 8)
	}
}

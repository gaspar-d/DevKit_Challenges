//
//  CarPlateViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarPlateController: UIViewController {
	
	private var customView: CarPlateViewProtocol
	private var viewModel: CarPlateViewModelProtocol
	
	init(customView: CarPlateViewProtocol,
		 viewModel: CarPlateViewModelProtocol)
	{
		self.customView = customView
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
		customView.setTextFieldDelegate(delegate: self)
	}
	
	private func setupView() {
		title = "Rodízio Automotivo SP"
		
		self.view = customView as? UIView
	}
	
	private func setupButtonAction() {
		customView.setPlateButtonAction(target: self,
										 action: #selector(didTapPlateButton))
	}
	
	@objc private func didTapPlateButton() {
		guard let plate = customView.getPlateInput else { return }
		
		viewModel.isInputValid(with: plate, controller: self)
		viewModel.navigateToCarRotation(with: plate)
		customView.cleanPlateField()
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

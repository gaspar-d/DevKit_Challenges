//
//  CarPlateViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

// MARK: - regex '/^[a-zA-Z]{3}[0-9][A-Za-z0-9][0-9]{2}$/'

final class CarPlateController: UIViewController, UITextFieldDelegate {

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
		customView?.setTextFieldDelegate(delegate: self)
	}
	
	// TODO: - Consolidate this
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		print("------------->", textField.text, #line)
		
		let a = textField.text?.replacingOccurrences(of: " ", with: "")
		
		textField.text = a?.applyPatternOnNumbers(pattern: "### ####", replacementCharacter: "#")
		
		return textLimit(textField.text ?? "", newText: string, limit: 8)
	}
	
	func textLimit(_ currentText: String, newText: String, limit: Int) -> Bool {
		let text = currentText
		let atLimit = text.count + newText.count <= limit
		
		return atLimit
	}
	
	
	
	func setupView() {
		title = "Rodízio Automotivo SP"
		
		customView = CarPlateView()
		self.view = customView
	}
	
	private func setupButtonAction() {
		customView?.setPlateButtonAction(target: self, action: #selector(didTapPlateButton))
	}
	
	@objc private func didTapPlateButton() {
		guard let plate = customView?.getPlateInput else {
			return
		}
		
		viewModel.navigateToCarRotation(with: plate)
		print(plate, #line)
	}
}


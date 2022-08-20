//
//  NumbersController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/08/22.
//

import UIKit

final class NumbersController: UIViewController {

	public var result: Int?
	
	private var customView: NumbersView?
	private let viewModel: NumbersViewModelProtocol
	
	init(viewModel: NumbersViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupResponsesField()
		setupTextFieldDelegate()
		setupRevealButtonAction()
	}
	
	private func setupView() {
		customView = NumbersView()
		self.view = customView
		
		title = "Números"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func setupResponsesField() {
		customView?.getInputText(target: self, action: #selector(onChangeInputField))
	}
	
	@objc func onChangeInputField(_ sender: UITextField) {
		
		guard let number = Int(sender.text ?? "") else { return }
		result = number
		
		let resultIsPrime = viewModel.isPrime(number)
		let resultIsEven = viewModel.isEven(number)
		let resultIsOdd = viewModel.isOdd(number)
		let resultIsNatural = viewModel.isNatural(number)
		
		customView?.setIsPrimeLabel(result: resultIsPrime)
		customView?.setIsEvenLabel(result: resultIsEven)
		customView?.setIsOddLabel(result: resultIsOdd)
		customView?.setIsNaturalLabel(result: resultIsNatural)
	}
	
	private func setupRevealButtonAction() {
		customView?.revealButtonAction(target: self, action: #selector(didTapRevealButton))
	}
	
	@objc private func didTapRevealButton() {
		guard let safeResult = result else { return }
		
		viewModel.presentModal(with: safeResult)
		
//		viewModel.presentModal(with: result ?? 999)
	}
}

// MARK: - Extension

extension NumbersController: UITextFieldDelegate {
	
	private func setupTextFieldDelegate() {
		customView?.setInputTextLabelDelegate(delegate: self)
	}
	
	func textFieldShouldClear(_ textField: UITextField) -> Bool {
		customView?.resetLabels()
		
		return true
	}
	
	func textField(_ textField: UITextField,
				   shouldChangeCharactersIn range: NSRange,
				   replacementString string: String) -> Bool {
		
		let allowedCharacters = CharacterSet(charactersIn: "-1234567890").inverted
		let characterSet = CharacterSet(charactersIn: string)
		
		if allowedCharacters.isSuperset(of: characterSet) {
			return false
		}
		
		return true
	}
}


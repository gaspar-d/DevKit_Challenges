//
//  NumbersController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/08/22.
//

import UIKit

final class NumbersController: UIViewController {

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
	}
	
	private func setupView() {
		customView = NumbersView()
		self.view = customView
		
		title = "Números"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func setupResponsesField() {
		customView?.getInputText(target: self, action: #selector(didTapRevealButton))
	}
	
	@objc func didTapRevealButton(_ sender: UITextField) {
		
		guard let number = Int(sender.text ?? "") else { return }
		
		print(#line, number / number)
		
		viewModel.isPrime(number)
		
		customView?.setIsPrimeLabel(number: number)
		customView?.setIsEvenLabel(number: number)
		customView?.setIsOddLabel(number: number)
		customView?.setIsNaturalLabel(number: number)
	}
}

// MARK: - Extension

extension NumbersController: UITextFieldDelegate {
	
	private func setupTextFieldDelegate() {
		customView?.setInputTextLabelDelegate(delegate: self)
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


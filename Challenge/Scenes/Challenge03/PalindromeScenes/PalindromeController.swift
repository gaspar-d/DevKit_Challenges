//
//  PalindromeController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 03/08/22.
//

import UIKit

final class PalindromeController: UIViewController {
	
	private var customView: PalindromeView?
	private let viewModel: PalindromeViewModelProtocol

	init(viewModel: PalindromeViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupButtons()
	}
	
	private func setupView() {
		customView = PalindromeView()
		self.view = customView
		
		title = "PALINDROMO"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func setupButtons() {
		customView?.didTapHelpButton(target: self, action: #selector(setHelpButtonAction))
		customView?.didTapVerifyButton(target: self, action: #selector(setVerifyButtonAction))
	}

	@objc func setHelpButtonAction() {
		viewModel.navigateToPalindromeDescription()
	}
	
	@objc func setVerifyButtonAction() {
		
		guard let inputedText = customView?.getInputedText()?.lowercased() else { return }

		viewModel.isPalindrome(input: inputedText, controller: self)
		customView?.cleanInput()
	}
}

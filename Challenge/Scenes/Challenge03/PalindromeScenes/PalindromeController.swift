//
//  PalindromeController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 03/08/22.
//

import UIKit
import SafariServices

final class PalindromeController: UIViewController {
	
	private let url = URL(string: "https://pt.wikipedia.org/wiki/Pal%C3%ADndromo") // Safari

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
//		let palindromeDescription = SFSafariViewController(url: url!) // safari
//		present(palindromeDescription, animated: true)
		
		
		viewModel.navigateToPalindromeDescription()
		print("Help pressed:")
	}
	
	@objc func setVerifyButtonAction() {
		print("Verify pressed")
		
		guard let inputedText = customView?.getInputedText() else { return }
		
		print(inputedText, #line)
	}
}

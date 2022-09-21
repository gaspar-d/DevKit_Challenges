//
//  PalindromeView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 03/08/22.
//

import UIKit

protocol PalindromeViewProtocol: AnyObject {
	func getInputedText() -> String?
	func didTapHelpButton(target: Any?, action: Selector)
	func didTapVerifyButton(target: Any?, action: Selector)
	func cleanInput()
}

final class PalindromeView: UIView {
	
	let itemsHeight: CGFloat = 54
	let itemsWidth: CGFloat = 0.9
	let verticalSpacing: CGFloat = 20.0
	
	private lazy var helpLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Não sabe o que é palíndromo?"
		label.textColor = .label
		return label
	}()
	
	private lazy var helpButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Clique aqui e saiba mais!", for: .normal)
		button.setTitleColor(UIColor.systemBlue, for: .normal)
		return button
	}()
	
	private lazy var helpStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [helpLabel, helpButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .leading
		stack.spacing = 5
		return stack
	}()
	
	private lazy var verifyLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Informe a frase"
		label.font = .systemFont(ofSize: 32, weight: .regular)
		label.textColor = .label
		return label
	}()
	
	private lazy var verifyTextField: UITextField = {
		let text = UITextField()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.layer.cornerRadius = 5
		text.layer.borderColor = UIColor.gray.cgColor
		text.layer.borderWidth = 1
		text.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 10, height: 0))
		text.leftViewMode = .always
		text.textColor = .label
		text.keyboardType = .alphabet
		return text
		
	}()
	
	private lazy var verifyStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [verifyLabel, verifyTextField])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .leading
		stack.spacing = 5
		return stack
	}()
	
	private lazy var verifyButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemPurple
		configuration.baseForegroundColor = .systemBackground
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		configuration.attributedTitle = AttributedString("Verificar", attributes: container)
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	private lazy var containerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [helpStack,
												   verifyStack])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .leading
		stack.spacing = verticalSpacing
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("ERROR: can't find PalindromeView")
	}
}
	
	// MARK: - Methods
extension PalindromeView: PalindromeViewProtocol {
	
	public func getInputedText() -> String? {
		return verifyTextField.text!
	}
	
	public func didTapHelpButton(target: Any?, action: Selector) {
		helpButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	public func didTapVerifyButton(target: Any?, action: Selector) {
		verifyButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	public func cleanInput() {
		verifyTextField.text = ""
	}
}

extension PalindromeView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(containerStack)
		addSubview(verifyButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			containerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			containerStack.centerXAnchor.constraint(equalTo: centerXAnchor),
			containerStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: itemsWidth),
			
			verifyTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: itemsWidth),
			verifyTextField.heightAnchor.constraint(equalToConstant: itemsHeight),
			
			verifyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			verifyButton.topAnchor.constraint(equalTo: containerStack.bottomAnchor, constant: verticalSpacing),
			verifyButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
			verifyButton.heightAnchor.constraint(equalToConstant: itemsHeight)
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .systemBackground
	}
}

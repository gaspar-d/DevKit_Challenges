//
//  PalindromeView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 03/08/22.
//

import UIKit

final class PalindromeView: UIView {
	
	private lazy var helpLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Não sabe o que é palíndromo?"
		
		return label
	}()
	
	private lazy var helpButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Clique e saiba mais!", for: .normal)
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
		configuration.title = "Verificar"
		configuration.baseBackgroundColor = .systemPurple
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
		stack.spacing = 15
		
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

extension PalindromeView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(containerStack)
		addSubview(verifyButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			containerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			containerStack.centerXAnchor.constraint(equalTo: centerXAnchor),
			containerStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
			
			verifyTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
			verifyTextField.heightAnchor.constraint(equalToConstant: 54),
			
			verifyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			verifyButton.topAnchor.constraint(equalTo: containerStack.bottomAnchor, constant: 15),
			verifyButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
			verifyButton.heightAnchor.constraint(equalToConstant: 54)
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .white
	}
}

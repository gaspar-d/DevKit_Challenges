//
//  NumbersView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/08/22.
//

import UIKit

final class NumbersView: UIView {
	
	// MARK: - Properties
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Qual o valor?"
		label.font = .systemFont(ofSize: 32)
		
		return label
	}()
	
	private lazy var inputField: UITextField = {
		let text = UITextField()
		text.layer.borderColor = UIColor.systemGray.cgColor
		text.clearButtonMode = .always
		text.layer.borderWidth = 1
		text.layer.cornerRadius = 5
		text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		text.leftViewMode = .always
		
		return text
	}()
	
	
	private lazy var isPrimeLabel: UILabel = {
		let label = UILabel()
		label.text = "prime?"
		
		return label
	}()
	
	private lazy var isEvenLabel: UILabel = {
		let label = UILabel()
		label.text = "even?"
		
		return label
	}()
	
	private lazy var isOddLabel: UILabel = {
		let label = UILabel()
		label.text = "odd"
		
		return label
	}()
	
	private lazy var isNaturalLabel: UILabel = {
		let label = UILabel()
		label.text = "natural"
		
		return label
	}()
	
	private lazy var resultsStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [isPrimeLabel,
												   isEvenLabel,
												   isOddLabel,
												   isNaturalLabel
												  ])
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .equalSpacing
		stack.layer.borderWidth = 1
		stack.layer.borderColor = UIColor.systemGray.cgColor
		stack.layer.cornerRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
		
		return stack
	}()
	
	private lazy var containerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [ titleLabel,
													inputField,
													resultsStack
												  ])
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .equalSpacing
		
		return stack
	}()
	
	private lazy var revealButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemIndigo
		configuration.buttonSize = .large
		
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
		configuration.attributedTitle = AttributedString("REVELAR", attributes: container)
		
		let button = UIButton(configuration: configuration)
		
		
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Methods
	
	public var getInputedNumber: String? {
		inputField.text
	}
	
	public func setIsPrimeLabel(number: String) {
		isPrimeLabel.text = number
	}

	public func testToPrintInput(target: Any?, action: Selector) {
		inputField.addTarget(target, action: action, for: .editingChanged)
	}
	
	public func revealButtonAction(target: Any?, action: Selector) {
		revealButton.addTarget(target, action: action, for: .touchUpInside)
	}
}


// MARK: - Extension
extension NumbersView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(containerStack)
		addSubview(revealButton)
		subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			containerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			containerStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
			containerStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
			
			inputField.heightAnchor.constraint(equalToConstant: 54),
			
			revealButton.topAnchor.constraint(equalTo: containerStack.bottomAnchor, constant: 20),
			revealButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			revealButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .systemBackground
	}
}

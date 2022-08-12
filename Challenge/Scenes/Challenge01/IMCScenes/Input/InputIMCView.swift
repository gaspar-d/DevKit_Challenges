//
//  InputIMCView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class InputIMCView: UIView {
	
	private let width = UIScreen.main.bounds.width
	
	// MARK: - Weight Container
	private lazy var weightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Peso"
		label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		return label
	}()
	
	private lazy var weightTextField: UITextField = {
		let text = UITextField()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.layer.borderWidth = 2
		text.layer.borderColor = UIColor.systemBlue.cgColor
		text.layer.cornerRadius = 10
		text.placeholder = "Seu peso em kg ex: 82"
		text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		text.leftViewMode = .always
		text.keyboardType = .numberPad
		
		return text
	}()
	
	private lazy var weightStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		stack.alignment = .center
		stack.backgroundColor = .systemBackground
		stack.layer.cornerRadius = 10
		stack.layer.shadowColor = UIColor.gray.cgColor
		stack.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		stack.layer.shadowOpacity = 0.3
		stack.layer.shadowRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
																 leading: 10,
																 bottom: 20,
																 trailing: 10)
		return stack
	}()
	
	// MARK: - Height Container
	private lazy var heightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Altura"
		label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		return label
	}()
	
	private lazy var heightTextField: UITextField = {
		let text = UITextField()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.layer.borderWidth = 2
		text.layer.borderColor = UIColor.systemBlue.cgColor
		text.layer.cornerRadius = 10
		text.placeholder = "Sua altura em cm ex: 180"
		text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		text.leftViewMode = .always
		text.keyboardType = .numberPad
		
		return text
	}()
	
	private lazy var heightStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		stack.alignment = .center
		stack.backgroundColor = .systemBackground
		stack.layer.cornerRadius = 10
		stack.layer.shadowColor = UIColor.gray.cgColor
		stack.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		stack.layer.shadowOpacity = 0.3
		stack.layer.shadowRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
																 leading: 10,
																 bottom: 20,
																 trailing: 10)
		return stack
	}()
	
	private lazy var stackContainer: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [weightStack, heightStack])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.spacing = 40
		stack.alignment = .center
		return stack
	}()
	
	// MARK: - Button
	private lazy var calculateButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.background.cornerRadius = 0
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		configuration.attributedTitle = AttributedString("Calcular", attributes: container)
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
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
	
	public func buttonAction(target: Any?, action: Selector) {
		calculateButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	public var getInputHeight: String {
		guard let height = heightTextField.text else { return "" }
		return height
	}
	
	public var getInputWeight: String {
		guard let weight = weightTextField.text else { return "" }
		return weight
	}
}

extension InputIMCView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stackContainer)
		addSubview(calculateButton)
	}
	
	func setupConstraints() {
		let textFieldWidth: CGFloat = 60
		let textFieldHeight: CGFloat = 44
		let stackPadding: CGFloat = 30
		
		NSLayoutConstraint.activate([
			
			weightTextField.widthAnchor.constraint(equalToConstant: width - textFieldWidth),
			weightTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
			weightStack.widthAnchor.constraint(equalToConstant: width - stackPadding),
			
			heightTextField.widthAnchor.constraint(equalToConstant: width - textFieldWidth),
			heightTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
			heightStack.widthAnchor.constraint(equalToConstant: width - stackPadding),
			
			stackContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
			stackContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			calculateButton.heightAnchor.constraint(equalToConstant: 80),
			calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor),
			calculateButton.widthAnchor.constraint(equalToConstant: width),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .systemBackground
	}
}


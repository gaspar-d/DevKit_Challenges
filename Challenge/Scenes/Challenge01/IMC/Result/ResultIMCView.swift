//
//  ResultIMCView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class ResultIMCView: UIView {
	
	let width = UIScreen.main.bounds.width
	
	private lazy var imcImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(systemName: "person.crop.circle.badge.checkmark")
		return image
	}()
	
	private lazy var numberLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "IMC number"
		label.font = UIFont.systemFont(ofSize: 102, weight: .heavy)
		return label
	}()
	
	private lazy var classificationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "IMC classification"
		label.font = UIFont.systemFont(ofSize: 42, weight: .heavy)
		return label
	}()
	
	private lazy var stackContainer: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [imcImage, numberLabel, classificationLabel])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.axis = .vertical
		stack.spacing = 20
		return stack
	}()
	
	private lazy var recalculateButton: UIButton = {
		var configuration = UIButton.Configuration.tinted()
		configuration.background.cornerRadius = 0
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		configuration.attributedTitle = AttributedString("Novo cálculo", attributes: container)
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	private lazy var closeButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.background.cornerRadius = 0
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		configuration.attributedTitle = AttributedString("Fechar", attributes: container)
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
	
	public func closeButtonAction(target: Any?, action: Selector) {
		closeButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	public func recalculateButtonAction(target: Any?, action: Selector) {
		recalculateButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	public func setNumberLabel(result: Float) {
		numberLabel.text = String(format: "%.1f", result)
	}
}

extension ResultIMCView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stackContainer)
		addSubview(recalculateButton)
		addSubview(closeButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			imcImage.heightAnchor.constraint(equalToConstant: 260),
			imcImage.widthAnchor.constraint(equalToConstant: 260),
			
			stackContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackContainer.bottomAnchor.constraint(equalTo: recalculateButton.topAnchor, constant: -40),
			stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			recalculateButton.heightAnchor.constraint(equalToConstant: 80),
			recalculateButton.topAnchor.constraint(equalTo: stackContainer.bottomAnchor),
			recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor),
			recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor),
			recalculateButton.bottomAnchor.constraint(equalTo: closeButton.topAnchor),
			
			closeButton.heightAnchor.constraint(equalToConstant: 80),
			closeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
			closeButton.bottomAnchor.constraint(equalTo: bottomAnchor),
			closeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .white
	}
}

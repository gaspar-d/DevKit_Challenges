//
//  ResultIMCView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class ResultIMCView: UIView {
	
	private lazy var imcImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(systemName: "person.fill.checkmark")
		
		return image
	}()
	
	private lazy var numberLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "IMC number"
		
		return label
	}()
	
	private lazy var classificationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "IMC classification"
		
		return label
	}()
	
	private lazy var recalculateButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Novo cálculo"
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	private lazy var closeButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Fechar"
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	private lazy var stackButtons: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [recalculateButton, closeButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.distribution = .fillProportionally
		stack.alignment = .center
		stack.axis = .vertical
		stack.spacing = 20
		
		return stack
	}()
	
	private lazy var stackLabels: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [numberLabel, classificationLabel])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.distribution = .fillProportionally
		stack.alignment = .center
		stack.axis = .vertical
		stack.spacing = 20
		
		return stack
	}()
	
	private lazy var stackContainer: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [imcImage, stackLabels, stackButtons])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.axis = .vertical
		stack.spacing = 20
		
		return stack
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
	
}

extension ResultIMCView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stackContainer)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			imcImage.heightAnchor.constraint(equalToConstant: 200),
			imcImage.widthAnchor.constraint(equalToConstant: 200),
			
			stackContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .purple
	}
}

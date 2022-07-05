//
//  CarPlateView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarPlateView: UIView {
	
	private let paddings: CGFloat = 20

	private lazy var plateLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Digite sua placa"
		label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
		label.textColor = .white
		return label
	}()
	
	private lazy var plateField: UITextField = {
		let text = UITextField()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.placeholder = "XXX-XXXX"
		text.textAlignment = .center
		text.layer.cornerRadius = 5
		text.backgroundColor = .white
		
		return text
	}()
	
	private lazy var plateButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Verificar"
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [plateLabel, plateField, plateButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.spacing = paddings
		stack.backgroundColor = .systemYellow
		stack.layer.cornerRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: paddings,
																 leading: paddings,
																 bottom: paddings,
																 trailing: paddings)
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - methods
	public func plateButtonAction(target: Any?, action: Selector) {
		plateButton.addTarget(target, action: action, for: .touchUpInside)
	}
}

extension CarPlateView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stack)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			
			plateField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
			plateField.heightAnchor.constraint(equalToConstant: 44),
			
			plateButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
			plateButton.heightAnchor.constraint(equalToConstant: 44),
			
			stack.centerXAnchor.constraint(equalTo: centerXAnchor),
			stack.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .yellow
	}
}